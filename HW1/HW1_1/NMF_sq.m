

subplot(2,3,3)
spy(W*H);
title(sprintf('NMF using 2 norm minimization, time: %f,norm: %f', toc,norm(mat-W*H,'fro')));



subplot(2,3,4)
spy(W*H);
title(sprintf('NMF using 2 norm NNDSVD, time: %f,norm: %f', toc,norm(mat-W*H,'fro')));