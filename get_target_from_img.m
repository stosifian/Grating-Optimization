function target = get_target_from_img(img_path)

    img = imread(img_path);
    target = double(img);
    target = target(:,:,2);
    target(target == 0) = 1; target(target > 1) = 0;
    
end