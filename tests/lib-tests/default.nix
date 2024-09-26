{
  lib
}: let 
  l = lib // builtins;

  loadFlake = flake: inputs: let
    requiredInputNames = l.attrNames flake.inputs;
    filteredInputs = l.getAttrs requiredInputNames inputs;
    self = { inputs = filteredInputs; } // (flake.outputs (filteredInputs // { inherit self; }));
  in self;
in {
  testPassInputs = let 
    flake = loadFlake {
      inputs = {
        input1.url = "github:jan-kouba/not-exits";
        input2.url = "github:jan-kouba/not-exits";
      };

      outputs = {input1, input2, ...}: {
        attrOut = "${input1.attr1} ${input2.attr2}";
      };
    } {
      input1 = { attr1 = "value1"; };
      input2 = { attr2 = "value2"; };
    };
  in assert (flake.attrOut == "value1 value2"); true;

  testRemovesUnspecifiedInputs = let
    flake = loadFlake {
      inputs.input1.url = "github:jan-kouba/not-exits";

      outputs = inputs: {
        inherit inputs;
      };
    } {
      input1 = { attr1 = "value1"; };
      input2 = { attr2 = "value2"; };
    };
  in assert !(l.elem "input2" (l.attrNames flake.inputs)); true;
}
