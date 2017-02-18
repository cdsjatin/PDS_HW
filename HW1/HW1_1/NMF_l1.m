%% Random Matrix generation using max of column of matrix



subplot(2,3,5)
spy(W*H);
title(sprintf('NMF using 2 norm NNDSVD, time: %f,norm: %f', toc,norm(mat-W*H,'fro')));

subplot(2,3,6)
spy(W*H);
title(sprintf('NMF using 2 norm NNDSVD, time: %f,norm: %f', toc,norm(mat-W*H,'fro')));