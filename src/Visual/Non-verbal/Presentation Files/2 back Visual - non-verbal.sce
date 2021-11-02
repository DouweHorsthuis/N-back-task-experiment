scenario = "2 back Visual - non-verbal";

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
pcl_file = "2 back Visual - non-verbal.pcl";
begin;
#loading stimuli
bitmap { filename = "1.png"; preload = true; } pic_cross;
bitmap { filename = "2.png"; preload = true; } pic_2;
bitmap { filename = "3.png"; preload = true; } pic_3;
bitmap { filename = "4.png"; preload = true; } pic_4;
bitmap { filename = "5.png"; preload = true; } pic_5;
bitmap { filename = "6.png"; preload = true; } pic_6;
bitmap { filename = "7.png"; preload = true; } pic_7;
bitmap { filename = "8.png"; preload = true; } pic_8;
bitmap { filename = "9.png"; preload = true; } pic_9;
bitmap { filename = "standard_et.jpg"; preload = true; } et_bit; # for the eyetracker

trial{ #this is the first screen to prepare people 
  trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # left-mouse button
   picture {
		text {font_size=25; font="Arial"; caption ="PLEASE DOUBLE PRESS THE YELLOW OR BLUE BUTTON TO START"; };
      x=0;y=0;};
}start_trial;

trial{ #this is the first screen to prepare people 
  trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1;   # left-ctrl button
   picture {
		text {font_size=25; font="Arial"; caption ="Press the BLUE key if the you see the square in the same place where it appeared two times ago \n \n Press the YELLOW key when you see the square anywhere else \n \n \n \n Press the BLUE key to continue";};
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
  trial_duration = 490;  #slightly less then 1 refesh rate the time for creation of the next stim       	
	stimulus_event {      #this makes sure it is 500ms and not 512ms
		picture {
			} target;
		target_button = 1;  
	}t_event;
		stimulus_event {
		nothing{};
		deltat=6;  
		port_code = 10; 
	}code_t_event;
}t_trial;

trial{ #this is the non-target trial 
  trial_duration = 490;  #slightly less then 1 refesh rate the time for creation of the next stim       	
	stimulus_event {      #this makes sure it is 500ms and not 512ms
		picture {
			} nontarget; 
		target_button = 2; 
	}nt_event;
	stimulus_event {
		nothing{};
		deltat=6;  
		port_code = 11; 
	}code_nt_event;
}nt_trial;

trial{ #this is the isi trial 
  trial_duration = 490;  #slightly less then 1 refesh rate the time for creation of the next stim       	
	stimulus_event {      #this makes sure it is 500ms and not 512ms
		picture {bitmap pic_cross;
		x=0; y=0;
			}fix_cross ; 
	}isi_event;
}isi_trial;

trial {
trial_duration = 2000;
	stimulus_event {
		picture {
		text {font_size=25; caption ="Block finished, saving eye tracking data, please wait a moment";};
      x=0;y=0;};
		code = "end";  
		port_code = 200;  
		time = 0;
   } event_end;  
} end_trial;