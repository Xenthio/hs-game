//=============================================================================
// 
// This script was made by Blixibon for Mapbase. You can use it as a template for your own scripts.
// 
//=============================================================================
//
// Purpose: This script demonstrates the abilities of VScriptProxy by
//          changing the texture's scale, rotation, and position.
// 
//          A VMT file can run this script by using the following commands:
//
//          "$baseCenter" ".5 .5"
//          "$baseScale" "1.0"
//          "$baseRotate" "0"
//          "$baseTranslate" "0 0"
//          
//          "Proxies"
//          {
//          	"VScriptProxy"
//          	{
//          		scriptfile "samples/material_proxy_1"
//          		var0 "$baseCenter"
//          		var1 "$baseScale"
//          		var2 "$baseRotate"
//          		var3 "$baseTranslate"
//          	}
//          
//          	"TextureTransform"
//          	{
//          		centerVar "$baseCenter"
//          		scaleVar "$baseScale"
//          		rotateVar "$baseRotate"
//          		translateVar "$baseTranslate"
//          		resultVar "$basetexturetransform"
//          	}
//          }
//
//=============================================================================

// OnBind is a hook which the VScript proxy calls every frame.
function OnBind()
{
    // NOTE: "self" refers to the proxy itself in this case. The entity using the material can be
    // accessed with "entity", but if the VMT is not applied to an entity, "entity" will be null.

    // This supports up to 8 vars, counting 0
    local center = self.GetVarVector(0)
    local scale = self.GetVarFloat(1)
    local rotate = self.GetVarFloat(2)
    local translate = self.GetVarVector(3)

    center.x += 0.0005
    center.y -= 0.001
    scale += 0.0005
    rotate += 0.1
    translate.x += 0.01

    if (center.x >= 2.0)
    {
        center.x = 0.5
        center.y = 0.5
    }

    if (scale >= 3.0)
    {
        scale = 0.1
    }

    if (rotate >= 360.0)
    {
        rotate = 0.0
    }

    if (translate.x >= 1.0)
    {
        translate.x = -1.0
    }

    self.SetVarVector(0, center)
    self.SetVarFloat(1, scale)
    self.SetVarFloat(2, rotate)
    self.SetVarVector(3, translate)
}
