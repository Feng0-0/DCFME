maxiter = 20;
restartProb = 0.50;
dim_drug = 512;
dim_prot = 512;
dim_dise = 512;
dim_se = 512;

drugNets = {'Sim_mat_drug_drug', 'Sim_mat_drug_disease', 'Sim_mat_drug_se', 'Sim_mat_Drugs'};
proteinNets = {'Sim_mat_protein_protein', 'Sim_mat_protein_disease', 'Sim_mat_Proteins'};
diseaseNets = {'Sim_mat_disease_drug', 'Sim_mat_disease_protein'};
sideNets = {'Sim_mat_se_drug_compoundNum'};

tic
D = DCA(drugNets, dim_drug, restartProb, maxiter);
toc
tic
P = DCA(proteinNets, dim_prot, restartProb, maxiter);
toc
tic
X = DCA(diseaseNets, dim_dise, restartProb, maxiter);
toc
tic
Y = DCA(sideNets, dim_se, restartProb, maxiter);
toc


dlmwrite(['../feature/drug_vector_d', num2str(dim_drug), '.txt'], D, '\t');
dlmwrite(['../feature/protein_vector_d', num2str(dim_prot), '.txt'], P, '\t');
dlmwrite(['../feature/disease_vector_d', num2str(dim_dise), '.txt'], X, '\t');
dlmwrite(['../feature/se_vector_d', num2str(dim_se), '.txt'], Y, '\t');
