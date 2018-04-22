function [models] = create_models()
    global FIG_SUBIMAGE

    images = [struct('im', {}, 'name', {})];

    im = imread('data/acmilan/22.jpg');
    images(end + 1).im = im(75:170, 50:110, :);
    images(end).name = '22.jpg';

    im = imread('data/barcelona/05.jpg');
    images(end + 1).im = im(250:end, 50:210, :);
    images(end).name = '05.jpg'; 

    im = imread('data/chelsea/26.jpg');
    images(end + 1).im = im(140:end, 15:150, :);
    images(end).name = '26.jpg';

    im = imread('data/juventus/15.jpg');
    images(end + 1).im = im(130:end, :, :);
    images(end).name = '15.jpg';

    im = imread('data/liverpool/31.jpg');
    images(end + 1).im = im(75:end, 60:165, :);
    images(end).name = '31.jpg';

    im = imread('data/madrid/32.jpg');
    images(end + 1).im = im(82:end, 45:140, :);
    images(end).name = '32.jpg';

    im = imread('data/psv/17.jpg');
    images(end + 1).im = im(100:end, 35:end, :);
    images(end).name = '17.jpg';

    im = imread('data/rcdespanol/11.jpg');
    images(end + 1).im = im(155:end, 245:385, :);
    images(end).name = '11.jpg';

    im = imread('data/roma/11.jpg');
    images(end + 1).im = im(120:end, 60:160, :);
    images(end).name = '11.jpg';


    models = [struct('team_id', {}, 'name', {}, 'im', {}, 'im_norm', {}, 'histogram', {}, 'regions', {})];


    for k = 1 : length(images)
        figure(FIG_SUBIMAGE), subplot(2, 1, 1), imshow(images(k).im);
        models(k).team_id = k;
        models(k).name = images(k).name;
        models(k).im = images(k).im;
        models(k).im_norm = hsv2rgb(normalizer_hsv(models(k).im));
        models(k).histogram = get_hsv_histogram(models(k).im);
        models(k).regions = extract_regions(models(k).histogram);
    end
end


function [regions] = extract_regions(histogram)
    global SEED
    max_weight = 0;
    for iteration = 1 : 1
        centroids = k_means(3, histogram);
        SEED = SEED + 1;
    end
    regions = [struct('from_x', {}, 'to_x', {}, 'from_y', {}, 'to_y', {}, 'sum', {}, 'hist', {})]

end

function [regions, weight] = get_regions(centroids)
    
end