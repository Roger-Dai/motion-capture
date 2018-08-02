% main_mvnx
output = 'def scan-straight():\n';
len = size(tree.subject.frames.frame);
poses = strings(1, len(2) - 3);
for i = 4:len(2)
    
    temp = tree.subject.frames.frame(i).position(70:72);
%     temp = temp + [0 0 -0.84];
    temp = temp + [0 0 -0.34];
    temp = string(temp);
    xyz = strcat(temp(1),',',temp(2),',',temp(3));

    quat = tree.subject.frames.frame(i).orientation(93:96);
    eul = quatern2euler(quat);
    eul = rad2deg(eul);
    eul = string(eul);
    rxyz = strcat(eul(1),',',eul(2),',',eul(3));
    
    pose = strcat('[',xyz,',',rxyz,']');
    poses(i-3) = pose;

    output = strcat(output,'movej(p[',xyz,',',rxyz,'], a = 0.3, v = 0.3, r = 0.01)\n');
    
end

output = strcat(output,'end\n');

fileID = fopen('./test7/scan--high-l.script','w');
fprintf(fileID, 'def scan():\n');
formatSpec = 'movel(p%s, a = 0.3, v = 0.3, r = 0.01)\n';
% formatSpec = 'servoj(p%s, lookahead_time = 0.1)\n';
fprintf(fileID, formatSpec, poses);
fprintf(fileID, 'end\n');
fclose(fileID);