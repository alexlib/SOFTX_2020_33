%This program generates synthetic PIV images and exports validation data.
%Copyright (C) 2019  Luís Mendes, Prof. Rui Ferreira, Prof. Alexandre Bernardino
%
%This program is free software; you can redistribute it and/or
%modify it under the terms of the GNU General Public License
%as published by the Free Software Foundation; either version 2
%of the License, or (at your option) any later version.
%
%This program is distributed in the hope that it will be useful,
%but WITHOUT ANY WARRANTY; without even the implied warranty of
%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%GNU General Public License for more details.
%
%You should have received a copy of the GNU General Public License
%along with this program; if not, write to the Free Software
%Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
%
%Special thanks go to Ana Margarida and Rui Aleixo
%and their initial effort on building a draft for a similar tool.

classdef UniformFlow
%UNIFORMFLOW Class that defines a uniform flow field
%   Detailed explanation goes here

    properties
        maxVelocityPixel
        imSizeX
        imSizeY
        marginsY
        dt
        Weight = 1.0;
    end
    methods
        function obj = UniformFlow(maxVelocityPixel, dt, imageProperties)
            obj.maxVelocityPixel = maxVelocityPixel;
            obj.dt = dt;
            obj.imSizeX = double(imageProperties.sizeX);
            obj.imSizeY = double(imageProperties.sizeY);
            obj.marginsY = double(imageProperties.marginsY);            
        end
        
        function [ x1, y1 ] = computeDisplacementAtImagePosition(obj, x0, y0)
            m=ones(size(x0, 1), size(x0, 2));
            x1 = m .* obj.maxVelocityPixel .* obj.dt + x0;
            y1 = m .* 0.0 + y0;
        end

        function [name] = getName(~) 
            name = 'Uniform flow';
        end
        
        function obj = set.Weight(obj, weight)
            obj.Weight = weight;
        end
    end
end

