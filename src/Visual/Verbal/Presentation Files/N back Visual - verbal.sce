scenario = "N back Visual - verbal";

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
pcl_file = "N back Visual - verbal.pcl";
begin;

trial{ #this is the first screen to prepare people 
  trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # left-mouse button
   picture {
		text {font_size=25; font="Arial"; caption ="PLEASE DOUBLE PRESS ANY Ctrl TO START"; font_color = 200,200,200;};
      x=0;y=0;};
	code = "201 start recording";  
	port_code = 201; 
}start_trial;

trial{ #this is the target trial 
  trial_duration = 500;        	
	stimulus_event {
		picture {	
			text {	
				caption = "!";
				text_align = align_center;
				font_color = 0,0,0;
			}t_txt;
			x = 256; y = -256;
		}t_pic; 
		port_code = 10;
		target_button = 1;  
	}t_event;
}t_trial;

trial{ #this is the non-target trial 
  trial_duration = 500;        	
	stimulus_event {
		picture {	
			text {	
				caption = "!";
				text_align = align_center;
				font_color = 0,0,0;
			}nt_txt;
			x = 256; y = -256;
		}nt_pic; 
		port_code = 11; 
		target_button = 2; 
	}nt_event;
}nt_trial;

trial {
trial_duration = 2000;
	stimulus_event {
		nothing{};
		code = "end";  
		port_code = 200;  
		time = 0;
   } event_end;  
} end_trial;