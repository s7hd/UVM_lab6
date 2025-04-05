class router_tb extends uvm_env;
  
  // UVC handles
  yapp_tx_env yapp;
  channel_env chan0, chan1, chan2;
  hbus_env hbus;
  clock_and_reset_env clk_rst;
  
  // Register with factory
  `uvm_component_utils(router_tb)
  
  // Component constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("BUILD", "Router testbench build phase executing", UVM_HIGH)

    // Create the YAPP UVC instance
    yapp = yapp_tx_env::type_id::create("yapp", this);
    
    // Create Channel UVC instances
    chan0 = channel_env::type_id::create("chan0", this);
    chan1 = channel_env::type_id::create("chan1", this);
    chan2 = channel_env::type_id::create("chan2", this);
    
    // Set channel_id for each channel instance
    uvm_config_int::set(this, "chan0", "channel_id", 0);
    uvm_config_int::set(this, "chan1", "channel_id", 1);
    uvm_config_int::set(this, "chan2", "channel_id", 2);

    // Create HBUS UVC instance
    hbus = hbus_env::type_id::create("hbus", this);
    
    // Configure HBUS UVC
    uvm_config_int::set(this, "hbus", "num_masters", 1);
    uvm_config_int::set(this, "hbus", "num_slaves", 0);

    // Create Clock and Reset UVC instance
    clk_rst = clock_and_reset_env::type_id::create("clk_rst", this);
  endfunction
  
  // Start of simulation phase
  function void start_of_simulation_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "start_of_simulation phase", UVM_HIGH)
  endfunction
  
endclass
