/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  27/07/2023 13:28:15                      */
/*==============================================================*/


alter table etudiants 
   drop foreign key FK_ETUDIANT_ASSOCIATI_SALLE_CL;

alter table etudiants 
   drop foreign key FK_ETUDIANT_ASSOCIATI_DM_MAITR;

alter table etudiants 
   drop foreign key FK_ETUDIANT_ASSOCIATI_FILIERES;

alter table etudiants 
   drop foreign key FK_ETUDIANT_ASSOCIATI_PARENT_E;

alter table etudiants 
   drop foreign key FK_ETUDIANT_ASSOCIATI_ENSEIGNA;

alter table facture 
   drop foreign key FK_FACTURE_ASSOCIATI_ETUDIANT;

alter table filieres 
   drop foreign key FK_FILIERES_ASSOCIATI_ENSEIGNA;

alter table jury_soutenance 
   drop foreign key FK_JURY_SOU_ASSOCIATI_DM_MAITR;

alter table matieres 
   drop foreign key FK_MATIERES_ASSOCIATI_ETUDIANT;

alter table matieres 
   drop foreign key FK_MATIERES_ASSOCIATI_ENSEIGNA;

alter table memoires_soutenance 
   drop foreign key FK_MEMOIRES_ASSOCIATI_ETUDIANT;

alter table memoires_soutenance 
   drop foreign key FK_MEMOIRES_ASSOCIATI_JURY_SOU;

alter table notes_classe 
   drop foreign key FK_NOTES_CL_ASSOCIATI_ETUDIANT;

alter table notes_examen 
   drop foreign key FK_NOTES_EX_ASSOCIATI_ETUDIANT;

alter table payement 
   drop foreign key FK_PAYEMENT_ASSOCIATI_FACTURE;

alter table salle_classe 
   drop foreign key FK_SALLE_CL_ASSOCIATI_JURY_SOU;

alter table utilisateurs 
   drop foreign key FK_UTILISAT_ASSOCIATI_ROLE_UTI;

drop table if exists dm_maitres_stage;

drop table if exists enseignants;


alter table etudiants 
   drop foreign key FK_ETUDIANT_ASSOCIATI_FILIERES;

alter table etudiants 
   drop foreign key FK_ETUDIANT_ASSOCIATI_PARENT_E;

alter table etudiants 
   drop foreign key FK_ETUDIANT_ASSOCIATI_ENSEIGNA;

alter table etudiants 
   drop foreign key FK_ETUDIANT_ASSOCIATI_SALLE_CL;

alter table etudiants 
   drop foreign key FK_ETUDIANT_ASSOCIATI_DM_MAITR;

drop table if exists etudiants;


alter table facture 
   drop foreign key FK_FACTURE_ASSOCIATI_ETUDIANT;

drop table if exists facture;


alter table filieres 
   drop foreign key FK_FILIERES_ASSOCIATI_ENSEIGNA;

drop table if exists filieres;


alter table jury_soutenance 
   drop foreign key FK_JURY_SOU_ASSOCIATI_DM_MAITR;

drop table if exists jury_soutenance;


alter table matieres 
   drop foreign key FK_MATIERES_ASSOCIATI_ENSEIGNA;

alter table matieres 
   drop foreign key FK_MATIERES_ASSOCIATI_ETUDIANT;

drop table if exists matieres;


alter table memoires_soutenance 
   drop foreign key FK_MEMOIRES_ASSOCIATI_ETUDIANT;

alter table memoires_soutenance 
   drop foreign key FK_MEMOIRES_ASSOCIATI_JURY_SOU;

drop table if exists memoires_soutenance;


alter table notes_classe 
   drop foreign key FK_NOTES_CL_ASSOCIATI_ETUDIANT;

drop table if exists notes_classe;


alter table notes_examen 
   drop foreign key FK_NOTES_EX_ASSOCIATI_ETUDIANT;

drop table if exists notes_examen;

drop table if exists parent_etudiant;


alter table payement 
   drop foreign key FK_PAYEMENT_ASSOCIATI_FACTURE;

drop table if exists payement;

drop table if exists role_utilisateur;


alter table salle_classe 
   drop foreign key FK_SALLE_CL_ASSOCIATI_JURY_SOU;

drop table if exists salle_classe;


alter table utilisateurs 
   drop foreign key FK_UTILISAT_ASSOCIATI_ROLE_UTI;

drop table if exists utilisateurs;

/*==============================================================*/
/* Table : dm_maitres_stage                                     */
/*==============================================================*/
create table dm_maitres_stage
(
   id_ms_dm             int not null  comment '',
   nom_prenom           national char(1)  comment '',
   fonction             national char(1)  comment '',
   date                 datetime  comment '',
   primary key (id_ms_dm)
);

/*==============================================================*/
/* Table : enseignants                                          */
/*==============================================================*/
create table enseignants
(
   id_enseignant        int not null  comment '',
   nom_prenom           national char(1)  comment '',
   adresse              national char(1)  comment '',
   telephone            int  comment '',
   email                national char(1)  comment '',
   date                 datetime  comment '',
   primary key (id_enseignant),
   key AK_Identifiant_1 (id_enseignant)
);

/*==============================================================*/
/* Table : etudiants                                            */
/*==============================================================*/
create table etudiants
(
   id_etudiant          int not null  comment '',
   id_parent            int not null  comment '',
   id_ms_dm             int not null  comment '',
   id_salle             int not null  comment '',
   id_enseignant        int not null  comment '',
   id_filiere           int not null  comment '',
   nom_prenom           national char(1)  comment '',
   date_naissance       national char(1)  comment '',
   telephone            int  comment '',
   matricule            national char(1)  comment '',
   date                 datetime  comment '',
   primary key (id_etudiant)
);

/*==============================================================*/
/* Table : facture                                              */
/*==============================================================*/
create table facture
(
   id_facture           int not null  comment '',
   id_etudiant          int not null  comment '',
   somme_paye           int  comment '',
   reste_payer          int  comment '',
   primary key (id_facture)
);

/*==============================================================*/
/* Table : filieres                                             */
/*==============================================================*/
create table filieres
(
   id_filiere           int not null  comment '',
   id_enseignant        int not null  comment '',
   nom_filiere          national char(1)  comment '',
   secteur_filiere      national char(1)  comment '',
   date                 datetime  comment '',
   primary key (id_filiere)
);

/*==============================================================*/
/* Table : jury_soutenance                                      */
/*==============================================================*/
create table jury_soutenance
(
   id_jury              int not null  comment '',
   id_ms_dm             int not null  comment '',
   president_jury       national char(1)  comment '',
   membre_jury          national char(1)  comment '',
   date_soutenance      datetime  comment '',
   primary key (id_jury)
);

/*==============================================================*/
/* Table : matieres                                             */
/*==============================================================*/
create table matieres
(
   id_matiere           int not null  comment '',
   id_enseignant        int not null  comment '',
   id_etudiant          int not null  comment '',
   nom_matiere          national char(1)  comment '',
   volume_horaire       int  comment '',
   date                 datetime  comment '',
   primary key (id_matiere)
);

/*==============================================================*/
/* Table : memoires_soutenance                                  */
/*==============================================================*/
create table memoires_soutenance
(
   id_memoire           int not null  comment '',
   id_etudiant          int not null  comment '',
   id_jury              int not null  comment '',
   nom_theme            national char(1)  comment '',
   date_depot           datetime  comment '',
   primary key (id_memoire)
);

/*==============================================================*/
/* Table : notes_classe                                         */
/*==============================================================*/
create table notes_classe
(
   id_note_classe       int not null  comment '',
   id_etudiant          int not null  comment '',
   libele_note          national char(1)  comment '',
   note                 int  comment '',
   primary key (id_note_classe)
);

/*==============================================================*/
/* Table : notes_examen                                         */
/*==============================================================*/
create table notes_examen
(
   id_examen            int not null  comment '',
   id_etudiant          int not null  comment '',
   libele_note          national char(1)  comment '',
   note                 int  comment '',
   primary key (id_examen)
);

/*==============================================================*/
/* Table : parent_etudiant                                      */
/*==============================================================*/
create table parent_etudiant
(
   id_parent            int not null  comment '',
   nom_prenom           national char(1)  comment '',
   adresse              national char(1)  comment '',
   telephone            int  comment '',
   email                national char(1)  comment '',
   primary key (id_parent),
   key AK_Identifiant_1 (email)
);

/*==============================================================*/
/* Table : payement                                             */
/*==============================================================*/
create table payement
(
   id_payement          int not null  comment '',
   id_facture           int not null  comment '',
   libele_payement      national char(1)  comment '',
   date_payement        datetime  comment '',
   primary key (id_payement)
);

/*==============================================================*/
/* Table : role_utilisateur                                     */
/*==============================================================*/
create table role_utilisateur
(
   id_role              int not null  comment '',
   liebele_role         national char(1)  comment '',
   primary key (id_role)
);

/*==============================================================*/
/* Table : salle_classe                                         */
/*==============================================================*/
create table salle_classe
(
   id_salle             int not null  comment '',
   id_jury              int not null  comment '',
   nom_salle            national char(1)  comment '',
   nombre_place         int  comment '',
   date                 datetime  comment '',
   primary key (id_salle)
);

/*==============================================================*/
/* Table : utilisateurs                                         */
/*==============================================================*/
create table utilisateurs
(
   id_user              int not null  comment '',
   id_role              int not null  comment '',
   nom_prenom           national char(1)  comment '',
   identifiant          national char(1)  comment '',
   password             national char(1)  comment '',
   date                 datetime  comment '',
   primary key (id_user)
);

alter table etudiants add constraint FK_ETUDIANT_ASSOCIATI_SALLE_CL foreign key (id_salle)
      references salle_classe (id_salle) on delete restrict on update restrict;

alter table etudiants add constraint FK_ETUDIANT_ASSOCIATI_DM_MAITR foreign key (id_ms_dm)
      references dm_maitres_stage (id_ms_dm) on delete restrict on update restrict;

alter table etudiants add constraint FK_ETUDIANT_ASSOCIATI_FILIERES foreign key (id_filiere)
      references filieres (id_filiere) on delete restrict on update restrict;

alter table etudiants add constraint FK_ETUDIANT_ASSOCIATI_PARENT_E foreign key (id_parent)
      references parent_etudiant (id_parent) on delete restrict on update restrict;

alter table etudiants add constraint FK_ETUDIANT_ASSOCIATI_ENSEIGNA foreign key (id_enseignant)
      references enseignants (id_enseignant) on delete restrict on update restrict;

alter table facture add constraint FK_FACTURE_ASSOCIATI_ETUDIANT foreign key (id_etudiant)
      references etudiants (id_etudiant) on delete restrict on update restrict;

alter table filieres add constraint FK_FILIERES_ASSOCIATI_ENSEIGNA foreign key (id_enseignant)
      references enseignants (id_enseignant) on delete restrict on update restrict;

alter table jury_soutenance add constraint FK_JURY_SOU_ASSOCIATI_DM_MAITR foreign key (id_ms_dm)
      references dm_maitres_stage (id_ms_dm) on delete restrict on update restrict;

alter table matieres add constraint FK_MATIERES_ASSOCIATI_ETUDIANT foreign key (id_etudiant)
      references etudiants (id_etudiant) on delete restrict on update restrict;

alter table matieres add constraint FK_MATIERES_ASSOCIATI_ENSEIGNA foreign key (id_enseignant)
      references enseignants (id_enseignant) on delete restrict on update restrict;

alter table memoires_soutenance add constraint FK_MEMOIRES_ASSOCIATI_ETUDIANT foreign key (id_etudiant)
      references etudiants (id_etudiant) on delete restrict on update restrict;

alter table memoires_soutenance add constraint FK_MEMOIRES_ASSOCIATI_JURY_SOU foreign key (id_jury)
      references jury_soutenance (id_jury) on delete restrict on update restrict;

alter table notes_classe add constraint FK_NOTES_CL_ASSOCIATI_ETUDIANT foreign key (id_etudiant)
      references etudiants (id_etudiant) on delete restrict on update restrict;

alter table notes_examen add constraint FK_NOTES_EX_ASSOCIATI_ETUDIANT foreign key (id_etudiant)
      references etudiants (id_etudiant) on delete restrict on update restrict;

alter table payement add constraint FK_PAYEMENT_ASSOCIATI_FACTURE foreign key (id_facture)
      references facture (id_facture) on delete restrict on update restrict;

alter table salle_classe add constraint FK_SALLE_CL_ASSOCIATI_JURY_SOU foreign key (id_jury)
      references jury_soutenance (id_jury) on delete restrict on update restrict;

alter table utilisateurs add constraint FK_UTILISAT_ASSOCIATI_ROLE_UTI foreign key (id_role)
      references role_utilisateur (id_role) on delete restrict on update restrict;

