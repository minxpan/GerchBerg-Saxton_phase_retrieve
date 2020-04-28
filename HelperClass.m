classdef HelperClass

    methods (Static)

        function E_Sample = supperposition(E_Sample)

            [M, N] = size(E_Sample);

            for ii = 1:M

                for jj = 1:N

                    E_Sample = E_Sample + HelperClass.Green(ii, jj);
                end

            end

        end

        function quantizedPhase = quantizePhase(Array)

            [M, N] = size(Array);
            quantized = [-pi, -pi / 2, 0, pi / 2, pi]; % four level quantization
            % quantized = [-pi,-3*pi / 4 -pi / 2, -pi / 4, 0, pi / 4, pi / 2,3*pi / 4 pi]; % eight level quantization

            for ii = 1:M

                for jj = 1:N
                    [~, idx] = min(abs(quantized - Array(ii, jj)));
                    Array(ii, jj) = quantized(idx);

                end

            end

            quantizedPhase = Array;
        end

        function BinarizedArray = Binarize(Array)

            [M, N] = size(Array);

            for ii = 1:M

                for jj = 1:N

                    if (Array(ii, jj) >= 0.25)% half amplitude
                        Array(ii, jj) = 1;
                    else
                        Array(ii, jj) = 0;
                    end

                end

            end

            BinarizedArray = Array;

        end

        function E_Sample = Green(coordImageX, coordImageY)

            global lambda k AmpImage N M dW z;
            [N, M] = size(AmpImage);
            amplitude = AmpImage(coordImageX, coordImageY); % inversely solved electric field at the sample plane

            SamplePlane = zeros(N, M); % electric field at sample plane.

            [coordSampleX, coordSampleY] = meshgrid((1:N) * dW, (1:M) * dW);

            for ii = 1:N

                for jj = 1:M

                    distance = (((coordImageX - ii) * dW)^2 + ((coordImageY - jj) * dW)^2 + z^2)^(-0.5);
                    SamplePlane(ii, jj) = amplitude * distance * exp(1i * k * distance);

                end

            end

            E_Sample = SamplePlane;
        end

        function normalizedIntensity = normalize(Original)
            [M, N] = size(Original);
            Emax = max(max(abs(Original)));

            for ii = 1:M

                for jj = 1:N

                    Original(ii, jj) = Original(ii, jj) / Emax;

                end

            end

            normalizedIntensity = Original;
        end

    end

end
