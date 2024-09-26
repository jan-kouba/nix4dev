{
  testInputs = let 
    flake = loadFlake {
      input1 = { attr1 = "value1"; };
      input2 = { attr2 = "value2"; };
    } {
      inputs = {
        input1.url = "github:jan-kouba/not-exits";
        input2.url = "github:jan-kouba/not-exits";
      };

      outputs = {input1, input2, ...}: {
        attrOut = "${input1.attr1} ${input2.attr2}";
      };
    };
    result = flake.attrOut == "value1 value2";
  in result;
}
