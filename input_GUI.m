function input_pattern = input_GUI(n)

    n = 64;
    data = repmat({''}, n, n);
    FigH = figure('Position', [640, 480, 640, 480]);
    t = uitable(FigH, 'Data', data, 'Position', [10, 10, 620, 460], ...
            'ColumnEditable', true);

    set(t, 'Data', data,'celleditcallback','get(t,''Data'')');

    % tableData = get(handles.uitable, 'Data');
    % tableData = [str2double(tableData(:, 1)), cell2mat(tableData(:, 2))];

    tableData = get(t,'Data')
    input_pattern = str2double(tableData)   