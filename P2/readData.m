function[class0,class1,class7,tgt2]=readData()
    file = fopen('output.txt');
    class0 = [];
    class1 = [];
    class7 = [];

    tgt2 = [];
    line = fgetl(file);
    i = 0;
    while ischar(line)
        arr = regexp(line, ',', 'split');
        class = arr(65);
        feature = arr(1:64);
        feature = str2double(arr(1:64));
        class = cell2mat(class);
        if class == '0'
            class0 = [class0; feature];
            tgt2 = [tgt2; str2double(arr(65))];
        elseif class == '1'
          class1 = [ class1; feature];
          tgt2 = [tgt2; str2double(arr(65))];
        elseif class == '7'
           class7 = [ class7; feature];
           tgt2 = [tgt2; str2double(arr(65))];
        end
        line = fgetl(file);
    end
end
