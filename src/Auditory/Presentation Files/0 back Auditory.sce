scenario = "0 back Auditory";

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
pcl_file = "0 back Auditory.pcl";
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

trial{ #this is the first screen to prepare people 
  trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1;   # left-ctrl button
   picture {
		text {font_size=25; font="Arial"; caption ="Please press the LEFT ctrl after you hear the letter X \n \n Please press the RIGHT ctrl after you hear any other letter \n \n \n \n press the left ctrl to continue"; font_color = 200,200,200;};
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


trial{ #this is the first screen to prepare people 
  trial_duration = forever;        	# trial lasts until target
   trial_type = specific_response;  # button is pressed
   terminator_button = 1,2;   # left-mouse button
   picture {
		text {font_size=25; font="Arial"; caption ="PLEASE DOUBLE PRESS ANY Ctrl TO START"; font_color = 200,200,200;};
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