scenario = "2 back Visual - verbal";

no_logfile = false;
scenario_type = trials;
response_matching = simple_matching;
default_background_color = 128, 128, 128;
default_text_color = 200, 200, 200;
default_font_size = 40;  
active_buttons = 2;
button_codes = 1,2;
write_codes = true; 
pulse_width = 10;
pcl_file = "2 back Visual - verbal - Practice.pcl";
begin;

text{caption = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nBlue                                                                 Yellow"; } t_nt_text;
picture { text t_nt_text; x = 0; y = 0; } t_nt_pic;
bitmap {filename = "2-back-Slide1.png";  preload = true;} slide1; picture{ bitmap slide1; x = 0; y = 0; }inst_1;
bitmap {filename = "2-back-Slide2.png";  preload = true;} slide2; picture{ bitmap slide2; x = 0; y = 0; }inst_2;
bitmap {filename = "2-back-Slide3.png";  preload = true;} slide3; picture{ bitmap slide3; x = 0; y = 0; }inst_3;
bitmap {filename = "2-back-Slide4.png";  preload = true;} slide4; picture{ bitmap slide4; x = 0; y = 0; }inst_4;
bitmap {filename = "2-back-Slide5.png";  preload = true;} slide5; picture{ bitmap slide5; x = 0; y = 0; }inst_5;
bitmap {filename = "2-back-Slide6.png";  preload = true;} slide6; picture{ bitmap slide6; x = 0; y = 0; }inst_6;
bitmap {filename = "2-back-Slide7.png";  preload = true;} slide7; picture{ bitmap slide7; x = 0; y = 0; }inst_7;

trial{ 
   trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # Ctrl  
	picture inst_1;
}instructions_1_trial;

trial{ 
   trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # Ctrl  
	picture inst_2;
}instructions_2_trial;

trial{ 
   trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # Ctrl  
	picture inst_3;
}instructions_3_trial;

trial{ 
   trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # Ctrl  
	picture inst_4;
}instructions_4_trial;

trial{ 
   trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # Ctrl  
	picture inst_5;
}instructions_5_trial;

trial{ 
   trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # Ctrl  
	picture inst_6;
}instructions_6_trial;

trial{ 
   trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # Ctrl  
	picture inst_7;
}instructions_7_trial;

trial{ #this is the first screen to prepare people 
  trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # left-mouse button
   picture {
		text {font_size=25; font="Arial"; caption ="PLEASE DOUBLE PRESS THE YELLOW OR BLUE BUTTON TO START"; font_color = 200,200,200;};
      x=0;y=0;};
}start_trial;

trial{ #this is the target trial 
  trial_duration = 500;        	
	stimulus_event {
		picture {	
			text {	
				caption = "!";
			}t_txt;
			x = 256; y = -256;
		}t_pic; 
		port_code = 10;
	}t_event;
}t_trial;

trial{ #this is the non-target trial 
  trial_duration = 500;        	
	stimulus_event {
		picture {	
			text {	
				caption = "!";
			}nt_txt;
			x = 256; y = -256;
		}nt_pic; 
		port_code = 11; 
	}nt_event;
}nt_trial;

trial { 
    trial_duration = 500; 
     picture t_nt_pic;  
    code = "target";
    target_button = 1; #so that a hit shows up if you press left button
} isi_t;

trial { 
    trial_duration = 500;  
     picture t_nt_pic;  
    code = "non-target";
    target_button = 2; #so that a hit shows up if you press right button
} isi_nt;

trial {
trial_duration = 2000;
	stimulus_event {
		nothing{};
		code = "end";  
		port_code = 200;  
		time = 0;
   } event_end;  
} end_trial;