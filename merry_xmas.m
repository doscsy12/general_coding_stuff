%% merry christmas
figure, hold on, N = 6^5; c = 50; k = randi(6,c,1); l = randperm(N,c);
q = @(x) rand(N,1); a = q()*2*pi; z=q(); r = .4*(1-z); t = q()
x = r.*cos(a); y = r.*sin(a); 

% coloured shapes/deco
P = {'ro','ys','md','b^','kh','c*'};

% plot christmas tree
scatter3(x.*t,y.*t,z,[],[zeros(N,1) (t.*r).^6 zeros(N,1)],'*')
% plot star
plot3(0,0,1.05,'rp','markers',12,'markerf','r')
% plot random deco
for i = 1:6
    L = l(k==i);
    plot3(x(L),y(L),z(L),P{i},'markers',8,'linew',2)
end
% plot tree stump
[X,Y,Z] = cylinder(.025,30);
surf(X,Y,-Z*.1)

% view sagittal
view(3, 9), axis equal off

% Initialize video
myVideo = VideoWriter('myXmasTree.avi'); %open video file
myVideo.FrameRate = 10;  %can adjust this, 5 - 10 usually works well
open(myVideo)

% add motion
for i = 1:9:c*9, 
    set(gca,'vie',[i,9]); 
    drawnow,    % force display to update immediately
    
    pause(0.01) % pause and grab frame
    frame = getframe(gcf); % get frame
    writeVideo(myVideo, frame);
end
close(myVideo)
