scenario = "0 back Visual - non-verbal";

no_logfile = false;
scenario_type = trials;
response_matching = simple_matching;
default_background_color = 128, 128, 128;
default_text_color = 255, 0, 255;
default_font_size = 40;  
active_buttons = 2;
button_codes = 1,2;
write_codes = false; 
pulse_width = 10;
pcl_file = "0 back Visual - non-verbal.pcl";
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


trial{ #this is the first screen to prepare people 
  trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # any-ctrl button
   picture {
		text {font_size=25; font="Arial"; caption ="PLEASE DOUBLE PRESS ANY Ctrl TO START"; font_color = 200,200,200;};
      x=0;y=0;};
	code = "201 start recording";  
	port_code = 201; 
}start_trial;

trial{ #this is the first screen to prepare people 
  trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1;   # left-ctrl button
   picture {
		text {font_size=25; font="Arial"; caption ="Please press the LEFT ctrl after you see the square in the left top corner \n \n Please press the RIGHT ctrl after you see the square anywhere else \n \n \n \n press the left ctrl to continue"; font_color = 200,200,200;};
      x=0;y=0;};
}instruction_trial;

trial{ #this is the target trial 
  trial_duration = 250;        	
	stimulus_event {
		picture {
			} target;
		port_code = 10;
		target_button = 1;  
	}t_event;
}t_trial;

trial{ #this is the non-target trial 
  trial_duration = 250;        	
	stimulus_event {
		picture {
			} nontarget; 
		port_code = 11; 
		target_button = 2; 
	}nt_event;
}nt_trial;

trial{ #this is the isi trial 
  trial_duration = 250;        	
	stimulus_event {
		picture {bitmap pic_cross;
		x=0; y=0;
			}fix_cross ; 
	}isi_event;
}isi_trial;

trial {
trial_duration = 2000;
	stimulus_event {
		nothing{};
		code = "end";  
		port_code = 200;  
		time = 0;
   } event_end;  
} end_trial;