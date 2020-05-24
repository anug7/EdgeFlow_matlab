
% Get opti-track measured speed, yawrate and time

% retrieve data set and set specific calibration data
if stereoboard_type==1
database_loc = 'stereoboard_testing/stereoboard_database/database_stereoboard_1/forward_camera/take';
shift_stereo_image = 5;
elseif stereoboard_type == 2
database_loc ='stereoboard_testing/stereoboard_database/database_stereoboard_2/forward_camera/take';
shift_stereo_image = -2;
end

[cam_Vx_frame, cam_Vy_frame, cam_Vz_frame, yaw_frame, t_frame] = getOptiTrack(track,database_loc);

%First 4 measurements tend to be faulty
cam_Vx_frame(1:4) =0;
cam_Vz_frame(1:4) =0;
yaw_frame(1:4) =0;



% New and old database are taken at different times. Some changes had been made to the optitrack system which requires reverting of the body axis. 
if stereoboard_type==1 
database_loc = 'stereoboard_testing/stereoboard_database/database_stereoboard_1/forward_camera/take';
elseif stereoboard_type == 2
database_loc ='stereoboard_testing/stereoboard_database/database_stereoboard_2/forward_camera/take';
 cam_Vz_frame = -cam_Vz_frame;
end

%Load Images (uses sort_nat)
dirname=[database_loc,num2str(track),'/'];

srcFiles = dir([dirname,'*.bmp']);
names= {srcFiles.name}';
names= sort_nat(names);

% Determine which frames to use from data set

start_i = 5;
end_i = size(names,1)-5;
% t_frame = t_frame(start_i:end_i);
% cam_Vx_frame = cam_Vx_frame(start_i:end_i);
% cam_Vy_frame = cam_Vy_frame(start_i:end_i);
% cam_Vz_frame = cam_Vz_frame(start_i:end_i);
