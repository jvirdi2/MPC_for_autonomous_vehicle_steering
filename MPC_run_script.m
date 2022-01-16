%% Running simulink MPC model
% More info can be found here: https://www.mathworks.com/help/releases/R2017b/mpc/examples/autonomous-vehicle-steering-using-model-predictive-control.html

load('mpc_lateral_control_data');
% Vx=30; (instability)
addpath(fullfile(matlabroot,'examples','mpc_featured','main'));

%% Plot lateral position vs desired lateral position
% Need reference previewer block used by plotReference command
T = 15;         % simulation duration
time = 0:0.1:T; % simulation time
sim('simple_lkas_mpc');

lat_pos_desired_diff_format=ref_preview.Data(1,1,1:end);
lat_pos_desired=lat_pos_desired_diff_format(:);

subplot(2,1,1)
plot(Vx*time,lat_pos_desired,'LineWidth',2)
hold on
grid on
plot(Vx*time,plant_output.Data(:,1),'g','LineWidth',2)
legend('desired lateral position','actual lateral position')
xlabel('X (m)')
ylabel('Y (m)')

yaw_desired_diff_format=ref_preview.Data(1,2,1:end);
yaw_desired=yaw_desired_diff_format(:);

subplot(2,1,2)
plot(Vx*time,yaw_desired,'LineWidth',2)
hold on
grid on
plot(Vx*time,plant_output.Data(:,2),'g','LineWidth',2)
legend('desired yaw angle','actual yaw angle')
xlabel('X (m)')
ylabel('Yaw angle (rad)')

