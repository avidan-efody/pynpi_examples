module top();
    reg clk = 0;
    reg valid = 0;
    reg[2:0] data;

    initial
      for(int i=0;i<10;i++) 
        begin 
          #10 clk = ~clk;

          if ($time() == 30)
            valid <=1;

          if ($time() == 60)
            valid <=0;

          if ($time() == 80)
            valid <=1;

          if ($time() > 100)
            $finish();
        end
endmodule
