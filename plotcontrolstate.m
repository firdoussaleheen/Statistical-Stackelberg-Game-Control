figure('Units', 'pixels', 'Position', [300 300 640 480]);

hData1 = plot(gamma1leader{1}(:,1), gamma1leader{1}(:,2));hold on;
hData2 = plot(gamma1leader{2}(:,1), gamma1leader{2}(:,2));hold on;
hData3 = plot(gamma1leader{3}(:,1), gamma1leader{3}(:,2));hold on;
hData4 = plot(gamma1leader{4}(:,1), gamma1leader{4}(:,2));hold on;
hData5 = plot(gamma1leader{5}(:,1), gamma1leader{5}(:,2));hold on;
hData6 = plot(gamma1leader{6}(:,1), gamma1leader{6}(:,2));hold on;
hData7 = plot(gamma1leader{7}(:,1), gamma1leader{7}(:,2));hold on;
hData8 = plot(gamma1leader{8}(:,1), gamma1leader{8}(:,2));hold on;
hData9 = plot(gamma1leader{9}(:,1), gamma1leader{9}(:,2));hold on;
hData10= plot(gamma1leader{10}(:,1), gamma1leader{10}(:,2));hold on;

set(hData1, 'LineStyle', '-', 'Color',  'r', 'LineWidth', 2);
set(hData2, 'LineStyle', '-', 'Color',  [0 0.5 0], 'LineWidth', 2);
set(hData3, 'LineStyle', '-', 'Color',  'b', 'LineWidth', 2);
set(hData4, 'LineStyle', '-', 'Color',  'c', 'LineWidth', 2);
set(hData5, 'LineStyle', '-', 'Color', 'm', 'LineWidth', 2);
set(hData6, 'LineStyle', '-', 'Color', 'y', 'LineWidth', 2);
set(hData7, 'LineStyle', '-', 'Color', 'k', 'LineWidth', 2);
set(hData8, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 2);
set(hData9, 'LineStyle', '--', 'Color', '[0 0.5 0]', 'LineWidth', 2);
set(hData10, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 2);
%     % Add labels
%     %hTitle = title('');
hXLabel = xlabel('t (s)');
hYLabel = ylabel('Leader control');

% Add legend
hLegend = legend([hData1, hData2, hData3, hData4, hData5, hData6, hData7, hData8, hData9, hData10 ], ...
        '\mu=0.1', '\mu=0.2', '\mu=0.3', '\mu=0.4', '\mu=0.5', '\mu=0.6', ...
        '\mu=0.7', '\mu=0.8', '\mu=0.9','\mu=1.0');
%     
%     % Adjust font
%     %set(gca, 'FontName', 'Times New Roman')
%     %set([hXLabel, hYLabel], 'FontName', 'Times New Roman')
%     
set([hLegend, gca], 'FontSize',10)
set([hXLabel, hYLabel], 'FontSize', 12)

% Adjust axes properties
grid on
set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
'LineWidth', 1)

%     xlim([t(1), t(end)]);
    set(gcf,'PaperPositionMode','auto');
     print -depsc2 leadercontrol.eps
%      close;
%%
figure('Units', 'pixels', 'Position', [300 300 640 480]);

hData1 = plot(gamma2follower{1}(:,1), gamma2follower{1}(:,2));hold on;
hData2 = plot(gamma2follower{2}(:,1), gamma2follower{2}(:,2));hold on;
hData3 = plot(gamma2follower{3}(:,1), gamma2follower{3}(:,2));hold on;
hData4 = plot(gamma2follower{4}(:,1), gamma2follower{4}(:,2));hold on;
hData5 = plot(gamma2follower{5}(:,1), gamma2follower{5}(:,2));hold on;
hData6 = plot(gamma2follower{6}(:,1), gamma2follower{6}(:,2));hold on;
hData7 = plot(gamma2follower{7}(:,1), gamma2follower{7}(:,2));hold on;
hData8 = plot(gamma2follower{8}(:,1), gamma2follower{8}(:,2));hold on;
hData9 = plot(gamma2follower{9}(:,1), gamma2follower{9}(:,2));hold on;
hData10= plot(gamma2follower{10}(:,1), gamma2follower{10}(:,2));hold on;

set(hData1, 'LineStyle', '-', 'Color',  'r', 'LineWidth', 2);
set(hData2, 'LineStyle', '-', 'Color',  [0 0.5 0], 'LineWidth', 2);
set(hData3, 'LineStyle', '-', 'Color',  'b', 'LineWidth', 2);
set(hData4, 'LineStyle', '-', 'Color',  'c', 'LineWidth', 2);
set(hData5, 'LineStyle', '-', 'Color', 'm', 'LineWidth', 2);
set(hData6, 'LineStyle', '-', 'Color', 'y', 'LineWidth', 2);
set(hData7, 'LineStyle', '-', 'Color', 'k', 'LineWidth', 2);
set(hData8, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 2);
set(hData9, 'LineStyle', '--', 'Color', '[0 0.5 0]', 'LineWidth', 2);
set(hData10, 'LineStyle', '--', 'Color', 'b', 'LineWidth', 2);
%     % Add labels
%     %hTitle = title('');
hXLabel = xlabel('Time, t (s)');
hYLabel = ylabel('Follower control, \gamma_2^*');

% Add legend
hLegend = legend([hData1, hData2, hData3, hData4, hData5, hData6, hData7, hData8, hData9, hData10 ], ...
        '\mu=0.1', '\mu=0.2', '\mu=0.3', '\mu=0.4', '\mu=0.5', '\mu=0.6', ...
        '\mu=0.7', '\mu=0.8', '\mu=0.9','\mu=1.0');
%     
%     % Adjust font
%     %set(gca, 'FontName', 'Times New Roman')
%     %set([hXLabel, hYLabel], 'FontName', 'Times New Roman')
%     
set([hLegend, gca], 'FontSize',10)
set([hXLabel, hYLabel], 'FontSize', 12)

% Adjust axes properties
grid on
set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
'LineWidth', 1)

%     xlim([t(1), t(end)]);
    set(gcf,'PaperPositionMode','auto');
     print -depsc2 followercontrol.eps
%      close;

%%
figure('Units', 'pixels', 'Position', [300 300 640 480]);

hData1 = plot(T, xtraj1{1}(:,1));hold on;
hData2 = plot(T, xtraj1{5}(:,1));hold on;
hData3 = plot(T, xtraj1{10}(:,1));hold on;


set(hData1, 'LineStyle', '-', 'Color',  'r', 'LineWidth', 2);
set(hData2, 'LineStyle', '-', 'Color',  [0 0.5 0], 'LineWidth', 2);
set(hData3, 'LineStyle', '-', 'Color',  'b', 'LineWidth', 2);

%     % Add labels
%     %hTitle = title('');
hXLabel = xlabel('Time, t (s)');
hYLabel = ylabel('State 1, x_{1}');

% Add legend
hLegend = legend([hData1, hData2, hData3],'\mu=0.1', '\mu=0.5', '\mu=1.0');
%     
%     % Adjust font
%     %set(gca, 'FontName', 'Times New Roman')
%     %set([hXLabel, hYLabel], 'FontName', 'Times New Roman')
%     
set([hLegend, gca], 'FontSize',10)
set([hXLabel, hYLabel], 'FontSize', 12)

% Adjust axes properties
grid on
set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
'LineWidth', 1)

%     xlim([t(1), t(end)]);
    set(gcf,'PaperPositionMode','auto');
     print -depsc2 state1.eps
%      close;
%%
figure('Units', 'pixels', 'Position', [300 300 640 480]);

figure('Units', 'pixels', 'Position', [300 300 640 480]);

hData1 = plot(T, xtraj1{1}(:,2));hold on;
hData2 = plot(T, xtraj1{5}(:,2));hold on;
hData3 = plot(T, xtraj1{10}(:,2));hold on;


set(hData1, 'LineStyle', '-', 'Color',  'r', 'LineWidth', 2);
set(hData2, 'LineStyle', '-', 'Color',  [0 0.5 0], 'LineWidth', 2);
set(hData3, 'LineStyle', '-', 'Color',  'b', 'LineWidth', 2);

%     % Add labels
%     %hTitle = title('');
hXLabel = xlabel('Time, t (s)');
hYLabel = ylabel('State 2, x_{2}');

% Add legend
hLegend = legend([hData1, hData2, hData3],'\mu=0.1', '\mu=0.5', '\mu=1.0');
%     
%     % Adjust font
%     %set(gca, 'FontName', 'Times New Roman')
%     %set([hXLabel, hYLabel], 'FontName', 'Times New Roman')
%     
set([hLegend, gca], 'FontSize',10)
set([hXLabel, hYLabel], 'FontSize', 12)

% Adjust axes properties
grid on
set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
'LineWidth', 1)

%     xlim([t(1), t(end)]);
    set(gcf,'PaperPositionMode','auto');
    print -depsc2 state2.eps
%      close;


