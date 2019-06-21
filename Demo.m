clear all;
close all;
imgList = dir('jpg/*.jpg');

minArea = 500;
maxArea = 1500;

for k = 1:numel(imgList)
    %     for k = 1:4
    S = imgList(k).name;
    FS = strcat('jpg/',S);
    I = imread(FS);
    IC = imcrop(I,[850, 0, 3650-851, 2100]); % Seleccionar area de interés
    BW = ~createMaskV3(IC);
    RG =regionprops(BW,'Eccentricity','Area','BoundingBox','Orientation','Centroid');
    figure;
    imshow(IC);
    hold on;
    %     figure;
    %     imshow(BW);
    %     hold on;
    Puntos = [];
    j = 1;
    for i=1:length(RG)
        if(RG(i).Area < maxArea && RG(i).Area > minArea)
            if(RG(i).Eccentricity > 0.8)
                %                 % Pieza domino
                %                 % Alto 286 pixels aprox.
                %                 % Ancho 143 pixels aprox.
                %                 % Diag 319 pixels aprox.
                
                Foto(k).Ficha(j).id = i;
                
                %plot(RG(i).Centroid(1),RG(i).Centroid(2),'gx');
                
                x_center = RG(i).Centroid(1);
                y_center = RG(i).Centroid(2);
                
                theta = -1*deg2rad(RG(i).Orientation);
                center = repmat([x_center; y_center], 1, length(1));
                R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
                
                s_x = 140;
                s_y = 280;
                
                xmin = x_center-s_x/2;
                ymin = y_center-s_y/2;
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                v = [xmin;ymin];
                
                % do the rotation...
                s = v - center;     % shift points in the plane so that the center of rotation is at the origin
                so = R*s;           % apply the rotation about the origin
                vo = so + center;   % shift again so the origin goes back to the desired center of rotation
                
                x_rotated = vo(1,:);
                y_rotated = vo(2,:);
                
                %plot(x_rotated,y_rotated,'mx');
                
                Foto(k).Ficha(j).shape(1).x(1) = x_rotated;
                Foto(k).Ficha(j).shape(1).y(1) = y_rotated;
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                v = [xmin+s_x;ymin];
                
                % do the rotation...
                s = v - center;     % shift points in the plane so that the center of rotation is at the origin
                so = R*s;           % apply the rotation about the origin
                vo = so + center;   % shift again so the origin goes back to the desired center of rotation
                
                x_rotated = vo(1,:);
                y_rotated = vo(2,:);
                
                %                 plot(x_rotated,y_rotated,'mx');
                
                Foto(k).Ficha(j).shape(1).x(2) = x_rotated;
                Foto(k).Ficha(j).shape(1).y(2) = y_rotated;
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                v = [xmin+s_x;ymin+s_y/2];
                
                % do the rotation...
                s = v - center;     % shift points in the plane so that the center of rotation is at the origin
                so = R*s;           % apply the rotation about the origin
                vo = so + center;   % shift again so the origin goes back to the desired center of rotation
                
                x_rotated = vo(1,:);
                y_rotated = vo(2,:);
                
                %                 plot(x_rotated,y_rotated,'mx');
                
                Foto(k).Ficha(j).shape(1).x(3) = x_rotated;
                Foto(k).Ficha(j).shape(1).y(3) = y_rotated;
                
                Foto(k).Ficha(j).shape(2).x(1) = x_rotated;
                Foto(k).Ficha(j).shape(2).y(1) = y_rotated;
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                v = [xmin;ymin+s_y/2];
                
                % do the rotation...
                s = v - center;     % shift points in the plane so that the center of rotation is at the origin
                so = R*s;           % apply the rotation about the origin
                vo = so + center;   % shift again so the origin goes back to the desired center of rotation
                
                x_rotated = vo(1,:);
                y_rotated = vo(2,:);
                
                %                 plot(x_rotated,y_rotated,'mx');
                
                Foto(k).Ficha(j).shape(1).x(4) = x_rotated;
                Foto(k).Ficha(j).shape(1).y(4) = y_rotated;
                
                Foto(k).Ficha(j).shape(2).x(2) = x_rotated;
                Foto(k).Ficha(j).shape(2).y(2) = y_rotated;
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                v = [xmin;ymin+s_y];
                
                % do the rotation...
                s = v - center;     % shift points in the plane so that the center of rotation is at the origin
                so = R*s;           % apply the rotation about the origin
                vo = so + center;   % shift again so the origin goes back to the desired center of rotation
                
                x_rotated = vo(1,:);
                y_rotated = vo(2,:);
                
                %                 plot(x_rotated,y_rotated,'mx');
                
                Foto(k).Ficha(j).shape(2).x(3) = x_rotated;
                Foto(k).Ficha(j).shape(2).y(3) = y_rotated;
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                v = [xmin+s_x;ymin+s_y];
                
                % do the rotation...
                s = v - center;     % shift points in the plane so that the center of rotation is at the origin
                so = R*s;           % apply the rotation about the origin
                vo = so + center;   % shift again so the origin goes back to the desired center of rotation
                
                x_rotated = vo(1,:);
                y_rotated = vo(2,:);
                
                %                 plot(x_rotated,y_rotated,'mx');
                
                Foto(k).Ficha(j).shape(2).x(4) = x_rotated;
                Foto(k).Ficha(j).shape(2).y(4) = y_rotated;
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                v = [xmin+s_x/2;ymin+s_y/4];
                
                % do the rotation...
                s = v - center;     % shift points in the plane so that the center of rotation is at the origin
                so = R*s;           % apply the rotation about the origin
                vo = so + center;   % shift again so the origin goes back to the desired center of rotation
                
                x_rotated = vo(1,:);
                y_rotated = vo(2,:);
                
                %                 plot(x_rotated,y_rotated,'mx');
                
                Foto(k).Ficha(j).c_shape(2).x = x_rotated;
                Foto(k).Ficha(j).c_shape(2).y = y_rotated;
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                v = [xmin+s_x/2;ymin+3*(s_y/4)];
                
                % do the rotation...
                s = v - center;     % shift points in the plane so that the center of rotation is at the origin
                so = R*s;           % apply the rotation about the origin
                vo = so + center;   % shift again so the origin goes back to the desired center of rotation
                
                x_rotated = vo(1,:);
                y_rotated = vo(2,:);
                
                %                 plot(x_rotated,y_rotated,'mx');
                
                Foto(k).Ficha(j).c_shape(1).x = x_rotated;
                Foto(k).Ficha(j).c_shape(1).y = y_rotated;
                
                %                 X = Foto(k).Ficha(j).shape(2).x;
                %                 Y = Foto(k).Ficha(j).shape(2).y;
                %                 plot(polyshape(X,Y));
                %                 X = Foto(k).Ficha(j).shape(1).x;
                %                 Y = Foto(k).Ficha(j).shape(1).y;
                %                 plot(polyshape(X,Y));
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                j=j+1;
            else
                %                 plot(RG(i).Centroid(1),RG(i).Centroid(2),'gx');
                Puntos = [Puntos; i];
            end
        end
    end
    
    for i=1:length(Foto(k).Ficha)
        
        X1 = Foto(k).Ficha(i).shape(2).x;
        Y1 = Foto(k).Ficha(i).shape(2).y;
        
        X2 = Foto(k).Ficha(i).shape(1).x;
        Y2 = Foto(k).Ficha(i).shape(1).y;
        
        Foto(k).Ficha(i).face(1) = 0;
        Foto(k).Ficha(i).face(2) = 0;
        
        for j=1:length(Puntos)
            if Puntos(j) ~= -1
                xq = RG(Puntos(j)).Centroid(1);
                yq = RG(Puntos(j)).Centroid(2);
                in = inpolygon(xq,yq,X1,Y1);
                if in == 1
                    z = Foto(k).Ficha(i).face(1);
                    z = z + 1;
                    Foto(k).Ficha(i).face(1) = z;
                    Puntos(j) = -1;
                end
            end
            if Puntos(j) ~= -1
                xq = RG(Puntos(j)).Centroid(1);
                yq = RG(Puntos(j)).Centroid(2);
                in = inpolygon(xq,yq,X2,Y2);
                if in == 1
                    z = Foto(k).Ficha(i).face(2);
                    z = z + 1;
                    Foto(k).Ficha(i).face(2) = z;
                    Puntos(j) = -1;
                end
            end
        end
    end
    
    for i=1:length(Foto(k).Ficha)
        x = Foto(k).Ficha(i).c_shape(1).x;
        y = Foto(k).Ficha(i).c_shape(1).y;
        z = int2str(Foto(k).Ficha(i).face(1));
        text(x,y,z);
        
        X = Foto(k).Ficha(i).shape(2).x;
        Y = Foto(k).Ficha(i).shape(2).y;
        
        if(z == '0')
            plot(polyshape(X,Y),'FaceColor','w','FaceAlpha',0.1);
        end
        if(z == '1')
            plot(polyshape(X,Y),'FaceColor','r','FaceAlpha',0.1);
        end
        if(z == '2')
            plot(polyshape(X,Y),'FaceColor','k','FaceAlpha',0.1);
        end
        if(z == '3')
            plot(polyshape(X,Y),'FaceColor','m','FaceAlpha',0.1);
        end
        if(z == '4')
            plot(polyshape(X,Y),'FaceColor','g','FaceAlpha',0.1);
        end
        if(z == '5')
            plot(polyshape(X,Y),'FaceColor','c','FaceAlpha',0.1);
        end
        if(z == '6')
            plot(polyshape(X,Y),'FaceColor','y','FaceAlpha',0.1);
        end
        
        x = Foto(k).Ficha(i).c_shape(2).x;
        y = Foto(k).Ficha(i).c_shape(2).y;
        z = int2str(Foto(k).Ficha(i).face(2));
        text(x,y,z);
        
        X = Foto(k).Ficha(i).shape(1).x;
        Y = Foto(k).Ficha(i).shape(1).y;
        
        if(z == '0')
            plot(polyshape(X,Y),'FaceColor','w','FaceAlpha',0.1);
        end
        if(z == '1')
            plot(polyshape(X,Y),'FaceColor','r','FaceAlpha',0.1);
        end
        if(z == '2')
            plot(polyshape(X,Y),'FaceColor','k','FaceAlpha',0.1);
        end
        if(z == '3')
            plot(polyshape(X,Y),'FaceColor','m','FaceAlpha',0.1);
        end
        if(z == '4')
            plot(polyshape(X,Y),'FaceColor','g','FaceAlpha',0.1);
        end
        if(z == '5')
            plot(polyshape(X,Y),'FaceColor','c','FaceAlpha',0.1);
        end
        if(z == '6')
            plot(polyshape(X,Y),'FaceColor','y','FaceAlpha',0.1);
        end
        
    end
    
    currkey=0;
    % do not move on until enter key is pressed
    while currkey~=1
        pause; % wait for a keypress
        currkey=get(gcf,'CurrentKey');
        if strcmp(currkey, 'space') % You also want to use strcmp here.
            currkey=1 % Error was here; the "==" should be "="
        else
            currkey=0 % Error was here; the "==" should be "="
        end
    end
    close all;
    
end

