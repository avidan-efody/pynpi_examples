module top();
    reg clk = 0;
    reg valid = 0;
    reg[2:0] data;

    reg data_is_5A;
    reg data_is_5B;

    initial begin
      int i;
      for(i=0;i<10;i++) 
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

          if (data == 5) begin
            data_is_5A <= 1;
            $display("intentional code coverage hole");
          end
        end
    end

    always @(posedge clk)
      begin
        if (valid == 1) 
          data <= 3;
        else
          data <= 0;

        // intentional code coverage hole
        if (data == 5) begin
          data_is_5B <= 1;
          $display("intentional code coverage hole");
        end
      end
       
endmodule
