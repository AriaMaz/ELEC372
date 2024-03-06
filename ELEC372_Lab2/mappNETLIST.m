function [A, b] = mappNETLIST(filename, f)
    % Open the file
    fid = fopen(filename, 'r');
    
    % Initialize a counter for the maximum node number
    maxNode = 0;
    extraRow = 0;
    counter = 0;

    %initalize s for inductor and capacitor
    s = (2*pi*f)*1i;
    % First pass to determine the size of matrices A and b
    while ~feof(fid)
        line = fgetl(fid);
        tokens = strsplit(line);
        type = tokens{1}(1);
        % Check node numbers and update maxNode if necessary
        n1 = str2double(tokens{2});
        n2 = str2double(tokens{3});
        if type == 'V' || type == 'L'   
            extraRow = extraRow + 1;
        end
        if n1 > 0
            maxNode = max(maxNode, n1);
        end
        if n2 > 0
            maxNode = max(maxNode, n2);
        end
    end
    
    % Close and reopen the file to reset the read position to the beginning
    fclose(fid);
    fid = fopen(filename, 'r');
    
    % Initialize matrix A and vector b with the correct size
    A = zeros(maxNode + extraRow); 
    b = zeros(maxNode + extraRow, 1);
    
    % Read the file line by line and update A and b
    while ~feof(fid)
        line = fgetl(fid);
        tokens = strsplit(line);
        
        % Determine the type of component (Resistor or Current Source)
        type = tokens{1}(1);
        n1 = str2double(tokens{2});
        n2 = str2double(tokens{3});
        value = str2double(tokens{4});

        % Update the matrices A and b based on the component type
        if type == 'R'
            % For resistors, update A matrix
            G = 1 / value; % Conductance is the inverse of resistance
            if n1 ~= 0
                A(n1, n1) = A(n1, n1) + G;
            end
            if n2 ~= 0
                A(n2, n2) = A(n2, n2) + G;
            end
            if n1 ~= 0 && n2 ~= 0
                A(n1, n2) = A(n1, n2) - G;
                A(n2, n1) = A(n2, n1) - G;
            end

        elseif type == 'I'
            % For current sources, update b vector
            if n1 ~= 0
                b(n1) = b(n1) - value; % Current entering node n1, assumed negative
            end
            if n2 ~= 0
                b(n2) = b(n2) + value; % Current leaving node n2, assumed positive
            end
        elseif type == 'V'
            counter = counter + 1;
            if n1 ~= 0 && n2 ~= 0
                A(n1, maxNode + counter) = A(n1, maxNode + counter) - 1;
                A(maxNode + counter, n1) = A(maxNode + counter, n1) - 1;
                A(n2, maxNode + counter) = A(n2, maxNode + counter) + 1;
                A(maxNode + counter, n2) = A(maxNode + counter, n2) + 1;
            
            elseif n1 ~= 0 && n2 == 0
                A(n1, maxNode + counter) = A(n1, maxNode + counter) - 1;
                A(maxNode + counter, n1) = A(maxNode + counter, n1) - 1;
            elseif n1 == 0 && n2 ~= 0
                A(n2, maxNode + counter) = A(n2, maxNode + counter) + 1;
                A(maxNode + counter, n2) = A(maxNode + counter, n2) + 1;
            end
            b(maxNode + counter) = value;
        elseif type == 'L'
            counter = counter + 1;
            if n1 ~= 0 && n2 ~= 0
                A(n1, maxNode + counter) = A(n1, maxNode + counter) - 1;
                A(maxNode + counter, n1) = A(maxNode + counter, n1) - 1;
                A(n2, maxNode + counter) = A(n2, maxNode + counter) + 1;
                A(maxNode + counter, n2) = A(maxNode + counter, n2) + 1;
                A(maxNode + counter, maxNode + counter) = A(maxNode + counter, maxNode + counter) - s*value;
            
            elseif n1 ~= 0 && n2 == 0
                A(n1, maxNode + counter) = A(n1, maxNode + counter) - 1;
                A(maxNode + counter, n1) = A(maxNode + counter, n1) - 1;
                A(maxNode + counter, maxNode + counter) = A(maxNode + counter, maxNode + counter) - s*value;
            elseif n1 == 0 && n2 ~= 0
                A(n2, maxNode + counter) = A(n2, maxNode + counter) + 1;
                A(maxNode + counter, n2) = A(maxNode + counter, n2) + 1;
                A(maxNode + counter, maxNode + counter) = A(maxNode + counter, maxNode + counter) - s*value;
            end
        elseif type == 'C'
            if n1 ~= 0 && n2 ~= 0
                A(n1, n1) = A(n1, n1) + s*value;
                A(n1, n2) = A(n1, n2) - s*value;
                A(n2, n1) = A(n2, n1) - s*value;
                A(n2, n2) = A(n2, n2) + s*value;
            elseif n1 ~= 0 && n2 == 0
                A(n1, n1) = A(n1, n1) + s*value;
            elseif n1 == 0 && n2 ~= 0
                A(n2, n2) = A(n2, n2) + s*value;
            end
        end
    end
    
    % Close the file
    fclose(fid);
end