%% Singular Value Thresholding

function Z = svt(Xsample,step_size,tol,tau,kmax)

subplot(2,2,1);
imshow(uint8(Xsample));
title(sprintf('Sampled image Rank: %d',rank(Xsample)));

Omega = Xsample;

[m,n] = size(Xsample);
E = zeros(m,n);
 Y = zeros(m,n);
 
subplot(2,2,4);


subplot(2,2,2);
title('rank vs iteration plot')
 tic

 for k=1:kmax
    [U,E,V] = svd(Y);
    Enew = max(E-tau.*eye(size(E)),0);
    Z = U*Enew*V';
    %pause(0.001)
    norm_a(k) = norm(P_omega(Xsample-Z,Omega),'fro');
    
    subplot(2,2,4);
    plot(norm_a,'MarkerSize',10);
    ylabel(sprintf('norm of Xsample-Z: %2.4f',norm_a(k)));
    xlabel(sprintf('# iter %d',k));
    grid;
    
    if(norm_a(k) < tol) break;
    end
    
    r(k) = rank(Z);
     subplot(2,2,2);
    plot(r,'MarkerSize',10);
    grid;
    xlim([0,150])
    ylim([0,200])
    
    xlabelstr = sprintf('# iter: %d',k); 
    xlabel(xlabelstr);
    ylabelstr = sprintf('Rank: %d',r(k));
    ylabel(ylabelstr);
    Y =  Y + step_size*P_omega( Xsample-Z,Omega);
    
end
time = toc;

subplot(2,2,3);
imshow(uint8(Z));
str = sprintf('Time: %2.5f s & Rank: %d',time,rank(Z));
title(str);
end
