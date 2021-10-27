[![Contributors][contributors-shield]][contributors-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<br />
<p align="center">
  <a href="https://github.com/DouweHorsthuis/N-back-task-experiment/">
    <img src="images/logo.jpeg" alt="Logo" width="160" height="160">
  </a> 

<h3 align="center">N-Back Task</h3>

<h4 align="center">N-Back task experiment for Presentation® NeuroBehavioral Systems, This tasks are created for the Cystinosis experiment battery (2021). There are 2 Visual versions (1 verbal and 1 non-verbal) and 1 auditory version.   
</h4>


**Table of Contents**
  
1. [About the project](#about-the-project)
2. [Getting started](#getting-started)
    - [Presentation settings](#presentation-settings)
3. [Info about the paradigm](#info-about-the-paradigm)
3. [Piloting Results (EEG)](#piloting-results-eeg)
3. [Contact](#contact)    
3. [Acknowledgement](#acknowledgement)




## About The Project
This Project has 3 different N-back tasks each designed to touch a different aspect of the working memory. 2 of them are Visual and 1 is auditory. 

1. Visual-verbal
    - For this experiment, participants will see a letter and have to do the N back task based on this.
    - This experiment has eyetracking.

2. Visual-non-verbal
    - For this experiment, participant will see a square and have to do the N-back task based on the location
    - This experiment has eyetracking.  
    
3. Auditory 
    - For this experiment, participant will hear letter being said out loud and have to do the N back task based on this.

## Getting Started

There is only 1 sequence file if you download this repo. Use the matlab script to create more and change the presentation code (line 8 and 9 in each of the PCL files). This is done so there are not an extra 100 files per paradigm. When using the paradigm you need these 100 sequences to make sure that everyone's paradigm is not following the same sequence.
``` 
#string file_path = direc + "sequences//" + printf(random(1,100),"n-back_sequence_%d.txt");
string file_path = direc + "sequences//" + printf(1,"n-back_sequence_%d.txt");
```
*Need to be*
``` 
string file_path = direc + "sequences//" + printf(random(1,100),"n-back_sequence_%d.txt");
#string file_path = direc + "sequences//" + printf(1,"n-back_sequence_%d.txt");
```
Like this it will choose randomly between the 100 sequence files. These files are all semi random with the rule that there are always at least 2 no-target trails between targets. It also makes sure that 80% of the trials are non-target trials

### Presentation settings

## Info about the paradigm  

### Stimuli
1. Visual-verbal
The stimuli are letter that presentation creates each time. This has a 2ms effect on the timing (see [Timing](#visual-verbal)), that we correct for. 

2. Visual-non-verbal
The stimuli are made in paint. They have a 7ms effect on the timing (as any picture that needs to be loaded does). See [Timing](#visual-non-verbal) for more info.   
      
3. Auditory 
The stimuli are recorded in the lab by [Ana Francisco](https://github.com/anafrancisco) and voiced by Alaina Berruti (lab member). They are cut in length so that the onset in of the stimulus in presentation is also the exect time the letter's sound start. THe do have different durations, this is why we have the trial lasting longer than the longest sound. 

### Logfiles  
Logfiles with experiment reaction times and other information automatically should be placed in the logfile folder. In these logfiles you will find the behavioral information of each time the experiment is ran.  

### Sequences  
In the Presentation Files folder you'll find the experiment and the sequences that are semi-randomized, so we are sure that there are no 2 target trials in a row and how many trials there are. These sequences are made so that there are always non-target trials before a target trial.  

### Instructions  
1. Visual-verbal
    - For this experiment, participants will see a letter and have to do the N back task based on this.  
      - 0-back = press left CTRL for the letter "X", press right CTRL for any other letter  
      - 1-back = press left CTRL if the previous letter is the same as the current one, press right CTRL when it is not the same  
      - 2-back = press left CTRL if the letter, 2 trials ago, is the same as the current one, press right CTRL when it is not the same  

2. Visual-non-verbal
    - For this experiment, participant will see a square and have to do the N-back task based on the location
      - 0-back = press left CTRL if the square is in the top right corner, press right CTRL for any other location  
      - 1-back = press left CTRL if the previous square was in the same place current one, press right CTRL when it was not the same  
      - 2-back = press left CTRL if the location of the square, 2 trials ago, is the same as the current one, press right CTRL when it is not the same.  
      
3. Auditory 
    - For this experiment, participant will hear letter being said out loud
      - 0-back = press left CTRL for the letter "X", press right CTRL for any other letter  
      - 1-back = press left CTRL if the previous letter is the same as the current one, press right CTRL when it is not the same  
      - 2-back = press left CTRL if the letter, 2 trials ago, is the same as the current one, press right CTRL when it is not the same. 
      

### Trigger codes
```
port_code=11; #0-back Non-Target
port_code=21; #1-back Non-Target
port_code=31; #2-back Non-Target
port_code=12; #0-back Target
port_code=22; #1-back Target
port_code=32; #2-back Target
port_code=1;  # Left - ctrl (After perceiving target)
port_code=2;  # Right- ctrl (After perceiving Non-target)
port_code=201;# to auto-start saving (biosemi)
port_code=200;# to auto-pause saving (biosemi)
```

### Timing  
#### Auditory N-back
Having measured the time between the stimuli and the trigger with an oscilosscope **we see a 1ms delay between the onset of any stimulus and the trigger**. The trial consists of the sound of a letter for a total of 1000ms. Due to the nature of spoken stimuli the duration of the leters themselves are different. But each trial takes 1000ms in total.

#### Visual Non-Verbal
Having measured the time between the stimuli and the trigger with an oscilosscope **we see a 0ms delay between the onset of any stimulus and the trigger**. This is because we delay the trigger by 7ms (this is the time the video card need to produce the visual stimulus). Each trial starts with the presentation of the stimulus for 500ms followed by an ISI trial of 500ms. The ISI trial is a picture of only the fixation cross. Because of refresh rates speeds the trials have different times in the code. This is because they are corrected for Adult booth Right.     

![timing](https://github.com/DouweHorsthuis/N-back-task-experiment/blob/main/images/visual_non_verbal_timing.JPG)  
It is clear that the onset of the trigger (orange) always is at the same time as where the visual stimulus (blue) changes from the norm.  

#### Visual Verbal
Having measured the time between the stimuli and the trigger with an oscilosscope **we see a 0ms delay between the onset of any stimulus and the trigger**. This is because we delay the trigger by 2ms (this is the time the video card need to produce the letters, this is a little unusual because all visual stimuli normally have a 7ms delay. This difference (5ms) is likely caused by not using a picture but presentation making the letters). Each trial starts with the presentation of the stimulus for 500ms followed by an ISI trial of 500ms. The ISI trial only has target and not target written in the bottom of the screen. Because of refresh rates speeds the trials have different times in the code. This is because they are corrected for Adult booth Right.     

![timing](https://github.com/DouweHorsthuis/N-back-task-experiment/blob/main/images/visual_verbal_timing.JPG)  
It is clear that the onset of the trigger (orange) always is at the same time as where the visual stimulus (blue) changes from the norm.

## Piloting Results (EEG)
We have collected data from 4 control participants and averaged their data. The data shown here is of the CPz channel and is shows the different difficulties plotted separtatly. It is clear that the data indeed shows a difference in the time window we expected (P3) and changes depending based on difficulty.  
  
**Auditory verbal**  
![Auditory verbal](https://github.com/DouweHorsthuis/N-back-task-experiment/blob/main/images/n-back_verb_aud.png)  
  
**Visual verbal**  
![Visual verbal](https://github.com/DouweHorsthuis/N-back-task-experiment/blob/main/images/n-back_verb_vis.png)  
  
**Visual non-verbal**
![Visual non-verbal](https://github.com/DouweHorsthuis/N-back-task-experiment/blob/main/images/n-back_non_verb_vis.png) 


## Contact

Douwe Horsthuis - [@douwejhorsthuis](https://twitter.com/douwejhorsthuis) - douwehorsthuis@gmail.com

Project Link: [https://github.com/DouweHorsthuis/N-back-task-experiment/](https://github.com/DouweHorsthuis/N-back-task-experiment/)




## Acknowledgements

* [Ana Francisco](https://github.com/anafrancisco) - The Research Assistant Professor that conceptualized the experiment



[contributors-shield]: https://img.shields.io/github/contributors/DouweHorsthuis/N-back-task-experiment.svg?style=for-the-badge
[contributors-url]: https://github.com/DouweHorsthuis/N-back-task-experiment/graphs/contributors
[license-shield]: https://img.shields.io/github/license/DouweHorsthuis/N-back-task-experiment.svg?style=for-the-badge
[license-url]: https://github.com/DouweHorsthuis/N-back-task-experiment/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/douwe-horsthuis-725bb9188
