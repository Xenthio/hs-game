//=============================================================================
// 
// This script was made by Blixibon for Mapbase. You can use it as a template for your own scripts.
// 
//=============================================================================
//
// Purpose: This script almost fully replicates logic_measure_movement in VScript
//          by utilizing functions newly exposed by Mapbase.
// 
//          The code is almost identical to what logic_measure_movement uses in
//          the original source code, using VScript counterparts of the exact same
//          functions. This version is missing most of Mapbase's enhancements to
//          logic_measure_movement, like measuring attachments or ignoring dimensions.
//
//=============================================================================

// These variables reflect the ones in logic_measure_movement.
m_hMeasureTarget <- null        // Entity to Measure -  Entity whose movement you want to measure.
m_hMeasureReference <- null     // Measure Reference - The movement of Entity to Measure will be measured relative to this entity.
m_hTarget <- null               // Entity to Move - This entity will be moved to mimic the motions of Entity to Measure.
m_hTargetReference <- null      // Movement Reference - The Entity to Move will move relative to this entity.

// What to measure.
// 0 = Absolute origin/angles
// 1 = Eye position/angles
m_nMeasureType <- 0

// A scale to divide the measured movements by, before applying those movements to the Entity to Move.
// 1 = target entity moves as much as the measured entity,
// 2 = target entity moves half as far as the measured entity, and
// 0.5 = target entity moves twice as far as the measured entity.
m_flScale <- 1.0

// This should be an entity's script think function
function MoveThink()
{
    // First, the code checks to make sure all of the required entities are valid.
    if (m_hMeasureTarget != null && m_hMeasureReference != null && m_hTargetReference != null && m_hTarget != null)
    {
        // This is where the position of the Entity to Measure is recorded.
        // Like logic_measure_movement, this supports multiple movement types.
        local matWorldToMeasure = matrix3x4_t()
        switch (m_nMeasureType)
        {
            // World position
            case 0:
            MatrixInvert( m_hMeasureTarget.EntityToWorldTransform(), matWorldToMeasure )
            break;

            // Eye position
            case 1:
            AngleIMatrix( m_hMeasureTarget.EyeAngles(), m_hMeasureTarget.EyePosition(), matWorldToMeasure )
            break;
        }

        // This is the difference in between the Entity to Measure's position and the Measure Reference's position.
        local matRefToMeasure = matrix3x4_t()
        ConcatTransforms( matWorldToMeasure, m_hMeasureReference.EntityToWorldTransform(), matRefToMeasure )

        if (m_flScale != 0.0 && m_flScale != 1.0)
        {
            // This code scales the movement according to the scale parameter.
            local vecTranslation = MatrixGetColumn( matRefToMeasure, 3 )
	    	vecTranslation /= m_flScale
		    MatrixSetColumn( matRefToMeasure, 3, vecTranslation )
        }

        // This is an inverted version of matRefToMeasure for the below ConcatTransforms to use.
        local matMeasureToRef = matrix3x4_t()
        MatrixInvert( matRefToMeasure, matMeasureToRef )

        // This is where the difference in between the Entity to Measure's position and the Measure Reference's position
        // is applied to the Target Reference's position, thus creating the position to move to.
        local matNewTargetToWorld = matrix3x4_t()
        ConcatTransforms( m_hTargetReference.EntityToWorldTransform(), matMeasureToRef, matNewTargetToWorld );

        // The position to move to is then applied to the Entity to Move and the logic_measure_movement operation is complete.
        local angAngles = Vector()
        local vecOrigin = Vector()
        MatrixAngles( matNewTargetToWorld, angAngles, vecOrigin )

        m_hTarget.SetAngles( angAngles )
        m_hTarget.SetOrigin( vecOrigin )

        // This allows the function to run on a tick-by-tick basis.
        return IntervalPerTick()
    }
}

function SetMeasureTarget( ent )
{
    m_hMeasureTarget = ent
}

function SetMeasureReference( ent )
{
    m_hMeasureReference = ent
}

function SetTarget( ent )
{
    m_hTarget = ent
}

function SetTargetReference( ent )
{
    m_hTargetReference = ent
}

function SetMeasureType( type )
{
    m_nMeasureType = type
}

function SetScale( scale )
{
    m_flScale = scale
}

// This is a shortcut for applying this script's variables to some pre-set names
function ApplyBasicMeasureTargets()
{
    SetMeasureTarget( Entities.FindByName(null,"measure_target") )
    SetMeasureReference( Entities.FindByName(null,"measure_reference") )
    SetTarget( Entities.FindByName(null,"measure_move") )
    SetTargetReference( Entities.FindByName(null,"measure_move_reference") )
}
