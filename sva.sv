  ast: assert property(
    @(posedge p_clk)
    $fell(cs) |=> (~cs) throughout ((sdo_en & $rose(sclk)) [=8] ##1 ~sdo_en ##1 $rose(sclk) [=8])
  ) $display("OK");
  else 
    $display("NG");