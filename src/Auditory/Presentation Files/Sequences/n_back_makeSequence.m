

% make a sequence for n-back paradigm with the following rules:
% -> 1 = non-target, 2 = target.
% -> A target has to be preceded by at least 2 non-target
% -> non-target comprise 80% of the sequence and target 20%
% -> the sequence is pseudorandom otherwise.
ntrls= 100;
nblcks= 1;
for b = 1:nblcks
    
    sequence = [];
    
    mini_seq_len = 100;
    
    for j = 1:ntrls/mini_seq_len
        
        standard_vec = ones(1,mini_seq_len*0.85);
        deviant_vec = 2.*ones(1,mini_seq_len*0.15);
        seq = [standard_vec deviant_vec];
        
        valid_seq = 0;
        while ~valid_seq
            
            seq = seq(randperm(length(seq)));
            
            valid_seq = 1;
            
            
            
            for i = 2:length(seq)
                if i == 2 
                    if seq(i) == 2 && seq(i-1) == 2
                        valid_seq = 0;
                    end
                elseif seq(i) == 2 && (seq(i-1) == 2 || seq(i-2) == 2)
                    valid_seq = 0;
                end
            end
            
            if seq(end) == 2 || seq(end-1) == 2
                valid_seq = 0;
            end
            
        end
        
        sequence = [sequence seq];
        
    end
    
    if any(diff(find(sequence==2))<3)
        disp('Something''s wrong here!!')
        keyboard
    end
    
    % Print the sequence into a text file
    
    fname = sprintf('n-back_sequence_%d.txt',b);
    fid = fopen(['C:\Users\dohorsth\Dropbox (EinsteinMed)\Ana and Douwe - work\cystinosis paradigms\N-back\Visual\Presentation Files\Sequences\' fname],'w');
    for n = 1:length(sequence)
        fprintf(fid,'%d\n',sequence(n));
    end
    fclose(fid);
    
end
