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
pcl_file = "2 back Visual - verbal.pcl";
begin;

text{caption = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTarget                                                                 Non-Target"; } t_nt_text;
picture { text t_nt_text; x = 0; y = 0; } t_nt_pic;
bitmap { filename = "standard_et.jpg"; preload = true; } et_bit; # for the eyetracker

trial{ #this is the first screen to prepare people 
  trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # left-mouse button
   picture {
		text {font_size=25; font="Arial"; caption ="PLEASE DOUBLE PRESS ANY Ctrl TO START"; font_color = 200,200,200;};
      x=0;y=0;};
}start_trial;

trial{ #this is the first screen to prepare people 
  trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1;   # left-ctrl button
   picture {
		text {font_size=25; font="Arial"; caption ="Press left CTRL when you see the letter X \n \n Press right CTRL for any other letter \n \n \n \n Press left CTRL to continue";};
      x=0;y=0;};
}instruction_trial;

trial{ # the first stim is too quick if there is no delay. This trial puts 2sec between the start and the stim
	trial_duration = 2000; #2 sec before the first stim
	stimulus_event {
		picture {
		text {caption ="+";};
      x=0;y=0;};
	}wait_event;
	stimulus_event {
	nothing{};
	deltat=500;
		code = "201 start recording";  
	port_code = 201; 
	}code_event;
}wait_trial;

trial{ #this is the target trial 
  trial_duration = 500;        	
	stimulus_event {
		picture {	
			text {	
				caption = "!";
			}t_txt;
			x = 0; y = 0;
		}t_pic;  
	}t_event;
	stimulus_event {
	nothing{};
	deltat=2;
	port_code = 10; 
	}s1_t_code_event;
}t_trial;

trial{ #this is the target trial 
  trial_duration = 500;        	
	stimulus_event {
		picture {	
			text {	
				caption = "!";
			}nt_txt;
			x = 0; y = 0;
		}nt_pic;  
	}nt_event;
	stimulus_event {
	nothing{};
	deltat=2;
	port_code = 11; 
	}s1_nt_code_event;
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