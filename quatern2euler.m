function euler = quatern2euler(q)
% This is a function that takes a quaternion input from Xsens(w, x, y, z), 
% and translate it into Euler angles in radians with ZYX order. Two formulas 
% in this program come from the Xsens documentation and wikipedia page for 
% quaternions. Both formulas produce the same results.

    q0 = q(1);
    q1 = q(2);
    q2 = q(3);
    q3 = q(4);

% This is according to the documentation of Xsens
    phi = atan2(2*(q0*q1+q2*q3), 2*(q0^2+q3^2)-1);
    theta = -asin(2*(q1*q3-q0*q2));
    psi = atan2(2*(q1*q2+q0*q3), 2*(q0^2+q1^2)-1);

% This is according to wikipedia
%     phi = atan2(2*(q0*q1+q2*q3), 1-2*(q1^2+q2^2));
%     theta = asin(2*(q0*q2-q1*q3));
%     psi = atan2(2*(q1*q2+q0*q3), 1-2*(q2^2+q3^2));

    euler = [phi theta psi];
    
end