scenario = "2 back Auditory - Instructions";

no_logfile = false;
scenario_type = trials;
response_matching = simple_matching;
default_background_color = 128, 128, 128;
default_text_color = 200,200,200;
default_font_size = 40;  
active_buttons = 2;
button_codes = 1,2;
write_codes = true; 
pulse_width = 10;
pcl_file = "2 back Auditory - Instructions.pcl";
begin;
#loading stimuli
sound { wavefile { filename = "a.wav"; preload = true; }; } a;
sound { wavefile { filename = "b.wav"; preload = true; }; } b;
sound { wavefile { filename = "c.wav"; preload = true; }; } c;
sound { wavefile { filename = "d.wav"; preload = true; }; } d;
sound { wavefile { filename = "e.wav"; preload = true; }; } e;
sound { wavefile { filename = "f.wav"; preload = true; }; } f;
sound { wavefile { filename = "g.wav"; preload = true; }; } g;
sound { wavefile { filename = "h.wav"; preload = true; }; } h;
sound { wavefile { filename = "i.wav"; preload = true; }; } i;
sound { wavefile { filename = "j.wav"; preload = true; }; } j;
sound { wavefile { filename = "k.wav"; preload = true; }; } k;
sound { wavefile { filename = "l.wav"; preload = true; }; } l;
sound { wavefile { filename = "m.wav"; preload = true; }; } m;
sound { wavefile { filename = "n.wav"; preload = true; }; } n;
sound { wavefile { filename = "o.wav"; preload = true; }; } o;
sound { wavefile { filename = "p.wav"; preload = true; }; } p;
sound { wavefile { filename = "q.wav"; preload = true; }; } q;
sound { wavefile { filename = "r.wav"; preload = true; }; } r;
sound { wavefile { filename = "s.wav"; preload = true; }; } s;
sound { wavefile { filename = "t.wav"; preload = true; }; } t;
sound { wavefile { filename = "u.wav"; preload = true; }; } u;
sound { wavefile { filename = "v.wav"; preload = true; }; } v;
sound { wavefile { filename = "w.wav"; preload = true; }; } w;
sound { wavefile { filename = "x.wav"; preload = true; }; } x;
sound { wavefile { filename = "y.wav"; preload = true; }; } y;
sound { wavefile { filename = "z.wav"; preload = true; }; } z;
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
	#port_code = 201; 
	}code_event;
}wait_trial;

trial{ #this is the first screen to prepare people 
  trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # left-mouse button
   picture {
		text {font="Arial"; caption ="PLEASE DOUBLE PRESS ANY Ctrl TO START";};
      x=0;y=0;}; 
}start_trial;

trial{ #this is to put a fixation cross
  trial_duration = 100;        	
	stimulus_event {
		picture {text {caption ="+";};
      x=0;y=0;};
	}fix_event;
}fix_trial;


trial{ #this is the target trial 
  trial_duration = 1000;        	
	stimulus_event {
		sound a; #will be replaced in the PCL 
		port_code = 10;#will be replaced in the PCL 
		target_button = 1;  
	}t_event;
}t_trial;


trial{ #this is the non-target trial 
  trial_duration = 1000;        	
	stimulus_event {
		sound a;#will be replaced in the PCL 
		port_code = 11; #will be replaced in the PCL 
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