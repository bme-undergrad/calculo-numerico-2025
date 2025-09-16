clc

training_data = [0 0;
                 0 1;
                 1 0;
                 1 1];
labels = [0;
          0;
          0;
          1];

n = 100;
weights = [0.1, 0.2];
bias = 0;
learning_rate = 0.01;
act_func = @(x) x;

loss = zeros(n,1);
for epoch = 1:n
    disp(['Epoch ', num2str(epoch)])
    sum_loss = 0;
    for ii = 1:length(training_data)
        inputs = training_data(ii,1:end)
        target = labels(ii);
        weighted_sum = weights(1)*inputs(1) + weights(2)*inputs(2) + bias;
        output = act_func(weighted_sum);
        error = output - target;
        weights(1) = weights(1) - learning_rate * error * inputs(1);
        weights(2) = weights(2) - learning_rate * error * inputs(2);
        bias = bias - learning_rate * error;
        disp(['  Inputs: [', num2str(inputs), '], Target: ', num2str(target), ', Output: ', num2str(output), ', Weights: [', num2str(weights), '], Bias: ', num2str(bias)])
        sum_loss = sum_loss + 1/2*(target-output)^2;
    end
    loss(epoch) = sum_loss/length(training_data);
end

disp('Testing perceptron after training:')
for ii = 1:size(training_data,1)
    inputs = training_data(ii,1:2);
    weighted_sum = weights(1)*inputs(1) + weights(2)*inputs(2) + bias;
    output = act_func(weighted_sum);
    disp(['  Inputs: [', num2str(inputs), '] => Output: ', num2str(output), ', i.e., ', num2str(output >= 0.5)])
end

plot(loss)


figure
hold on
x = -5:0.1:15;
for NG = 1:8
  f = x.^3-14*x.^2+35*x+10*NG;
  plot(x,f)
endfor
grid on
legend('1', '2', '3', '4', '5', '6', '7', '8')
hold off

