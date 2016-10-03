function trajectory_str = create_traj_struct(time, x, y, z)
%CREATE_TRAJ_STRUCY Create a trajectory structure with fixed shape (field orders and meaning)

trajectory_str = [];

%check input lenghts
if length(time) ~= length(x) || length(time) ~= length(y) || length(time) ~= length(z) || ...
   length(x) ~= length(y)    || length(x) ~= length(z)    || length(y) ~= length(z)
    error('Input fields [time, x, y, z] must have same lenghts');
    return;
end

%make sure inputs are column vectors
time = trajectory_evaluation.column_vector(time);
x = trajectory_evaluation.column_vector(x);
y = trajectory_evaluation.column_vector(y);
z = trajectory_evaluation.column_vector(z);

%create trajectory structure
trajectory_str.time = time;
trajectory_str.x = x;
trajectory_str.y = y;
trajectory_str.z = z;

end

