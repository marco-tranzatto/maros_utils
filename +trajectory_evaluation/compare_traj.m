function [x_err, y_err, z_err, time, x_rms, y_rms, z_rms] = compare_traj(ground_truth_struct, sampled_trajectory_struct)
%COMPARE_TRAJ Compute errors and root mean square errors of two
%trajectories. The errors are computed only based on the ground truth
%trajectory points, and the sampled trajectory is interpolated if required
%to compute them.

% interpolate sampled_trajecotry to have trajectory points at same
% timestamps of points in ground truth trajectory
interpolated_sampled_traj = [];

interpolated_sampled_traj.time = ground_truth_struct.time;

interpolated_sampled_traj.x = spline(sampled_trajectory_struct.time, ...
                                     sampled_trajectory_struct.x, ...
                                     ground_truth_struct.time);
                                 
interpolated_sampled_traj.y = spline(sampled_trajectory_struct.time, ...
                                     sampled_trajectory_struct.y, ...
                                     ground_truth_struct.time);
                                 
interpolated_sampled_traj.z = spline(sampled_trajectory_struct.time, ...
                                     sampled_trajectory_struct.z, ...
                                     ground_truth_struct.time);
                                 
% compute errors
x_err = interpolated_sampled_traj.x - ground_truth_struct.x;
y_err = interpolated_sampled_traj.y - ground_truth_struct.y;
z_err = interpolated_sampled_traj.z - ground_truth_struct.z;
time = ground_truth_struct.time;
                                 
% compute RMS errors
x_rms = sqrt( mean( (x_err).^2 ) );
y_rms = sqrt( mean( (y_err).^2 ) );
z_rms = sqrt( mean( (z_err).^2 ) );


end

