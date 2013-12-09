function img = drawLine(img, lineStart, lineEnd, lineWidth, colour)

assert(size(img, 3) == length(colour)); % Check for same number of colour channels.

dVector = lineEnd - lineStart;
hatVector = 1.0*[dVector(2), -dVector(1)] / norm(dVector);
pos1 = lineStart + 0.5 * lineWidth * hatVector;
pos2 = lineStart - 0.5 * lineWidth * hatVector;
pos3 = lineEnd - 0.5 * lineWidth * hatVector;
pos4 = lineEnd + 0.5 * lineWidth * hatVector;

x = [pos1(1), pos2(1), pos3(1), pos4(1)];
y = [pos1(2), pos2(2), pos3(2), pos4(2)];
bw = poly2mask(x, y, size(img, 1), size(img, 2));

if(length(colour) == 1)
    img(bw) = colour;
elseif(length(colour) == 3)
    for k = 1:3
        tempImg = img(:, :, k);
        tempImg(bw) = colour(k);
        img(:, :, k) = tempImg;
    end
end
end
