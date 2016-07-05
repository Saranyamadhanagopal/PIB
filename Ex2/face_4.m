function face_4()

addpath('.\colorImages','-end');
addpath('.\..\LP2_utils','-end');

IO = imread( 'face.jpg' );

IO_R = IO(:,:,1);
IO_G = IO(:,:,2);
IO_B = IO(:,:,3);
% 
% figure(1);
% subplot(221); imshow(IO); title('IO-Color [R, G, B]' );
% subplot(222); imshow(IO_R); title(' Red component' );
% subplot(223); imshow(IO_G); title(' Green component' );
% subplot(224); imshow(IO_B); title(' Blue component' );
% impixelinfo;


IN = rgb2hsv(imread( 'face_4.jpg' ));
IN_R = IN(:,:,1);
IN_G = IN(:,:,2);
IN_B = IN(:,:,3);

difBright_IO_IN = difBrightnessColor( IO, IN );
fprintf( ' Dif. de brilho face - face_3:%d\n', difBright_IO_IN );
difContr_IO_IN = difContrastColor( IO, IN, 20 );
fprintf( ' Dif de contraste face - face_3:%d\n', difContr_IO_IN );
difEntropy_IO_IN = difPredictabilityColor( IO, IN );
fprintf( ' Dif. de entropia face - face_3:%d\n', difEntropy_IO_IN );

figure(2);
subplot(221); imshow(IN); title('IN' );
subplot(222); imshow(IN_R); title(' H component' );
subplot(223); imshow(IN_G); title(' S component' );
subplot(224); imshow(IN_B); title(' V component' );
impixelinfo;


IF(:,:,1)=IN_R;
IF(:,:,2)=IN_B;
IF(:,:,3)=IN_G;
IF=hsv2rgb(IF);


figure(3);
subplot(221); imshow(IF); title('IF-Color [R, G, B]' );
subplot(222); imshow(IF(:,:,1)); title(' H component' );
subplot(223); imshow(IF(:,:,2)); title(' S component' );
subplot(224); imshow(IF(:,:,3)); title(' V component' );

difBright_IO_IF = difBrightnessColor( IO, IF );
fprintf( 'Dif. de brilho face - face_F:%d\n', difBright_IO_IF );
difContr_IO_IF = difContrastColor( IO, IF, 20 );
fprintf( ' Dif. de contraste face - face_F:%d\n', difContr_IO_IF );
difEntropy_IO_IF = difPredictabilityColor( IO, IF );
fprintf( ' Dif. de entropia face - face_F:%d\n', difEntropy_IO_IF );

figure(4);
subplot(121); imshow(IO); title('I original' );
subplot(122); imshow(IF); title('I processed' );

end

