/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     16-12-13 18:17:12                            */
/*==============================================================*/


drop table if exists areaPoseeAtrarea;

drop table if exists areas;

drop table if exists asignacionPersonaRecintoAreas;

drop table if exists atributoAreas;

drop table if exists atributoPersonas;

drop table if exists atributoRecintos;

drop table if exists estadoPersonas;

drop table if exists estadoRecintos;

drop table if exists historialOcupamientoRecintos;

drop table if exists historialPersonas;

drop table if exists historialRecintos;

drop table if exists notificaciones;

drop table if exists personas;

drop table if exists recintos;

drop table if exists reservaRecintos;

drop table if exists tipoAtributoAreas;

drop table if exists tipoAtributoPersonas;

drop table if exists tipoAtributoRecintos;

drop table if exists tipoEstadoPersonas;

drop table if exists tipoEstadoRecintos;

drop table if exists tipoOperacionPersonas;

drop table if exists tipoOperacionRecintos;

drop table if exists tipoPersonas;

drop table if exists tipoRecintos;

drop table if exists tipoperClasificaPer;

drop table if exists tipoperPresentaTipoestper;

drop table if exists usuarioRecibeNotificacion;

drop table if exists usuarios;

/*==============================================================*/
/* Table: areaPoseeAtrarea                                      */
/*==============================================================*/
create table areaPoseeAtrarea
(
   idTipoAtributoArea   int not null,
   idAtributosArea      int not null,
   idArea               int not null,
   primary key (idTipoAtributoArea, idAtributosArea, idArea)
);

/*==============================================================*/
/* Table: areas                                                 */
/*==============================================================*/
create table areas
(
   idArea               int not null,
   areIdArea            int,
   nombreArea           varchar(20),
   primary key (idArea)
);

/*==============================================================*/
/* Table: asignacionPersonaRecintoAreas                         */
/*==============================================================*/
create table asignacionPersonaRecintoAreas
(
   idPersona            int not null,
   idTipoRecinto        int not null,
   idRecinto            int not null,
   idArea               int not null,
   idUsuario            int not null,
   idHistorialOcupamientoRecinto int not null,
   idAsignacionPersonaRecintoArea int not null,
   fechaIniAsignacionPersonaRecintoArea date,
   horaIniAsignacionPersonaRecintoArea time,
   fechaFinAsignacionPersonaRecintoArea date,
   horaFinAsignacionPersonaRecintoArea time,
   primary key (idTipoRecinto, idPersona, idRecinto, idArea, idUsuario, idHistorialOcupamientoRecinto)
);

/*==============================================================*/
/* Table: atributoAreas                                         */
/*==============================================================*/
create table atributoAreas
(
   idTipoAtributoArea   int not null,
   idAtributosArea      int not null,
   valorAtributoArea    varchar(20),
   primary key (idTipoAtributoArea, idAtributosArea)
);

/*==============================================================*/
/* Table: atributoPersonas                                      */
/*==============================================================*/
create table atributoPersonas
(
   idTipoAtributoPersona int not null,
   idAtributoPersona    int not null,
   idPersona            int not null,
   valorAtributoPersona varchar(20),
   primary key (idTipoAtributoPersona, idAtributoPersona)
);

/*==============================================================*/
/* Table: atributoRecintos                                      */
/*==============================================================*/
create table atributoRecintos
(
   idTipoAtributosRecinto int not null,
   idAtributoRecinto    int not null,
   idTipoRecinto        int not null,
   idRecinto            int not null,
   valorAtributoRecinto varchar(20),
   primary key (idTipoAtributosRecinto, idAtributoRecinto)
);

/*==============================================================*/
/* Table: estadoPersonas                                        */
/*==============================================================*/
create table estadoPersonas
(
   idEstadoPersona      int not null,
   idTipoEstadoPersona  int not null,
   idPersona            int not null,
   valorEstadoPersona   varchar(20),
   primary key (idEstadoPersona)
);

/*==============================================================*/
/* Table: estadoRecintos                                        */
/*==============================================================*/
create table estadoRecintos
(
   idEstadoRecinto      int not null,
   idTipoRecinto        int,
   idRecinto            int,
   idTipoEstadoRecinto  int not null,
   valorEstadoRecinto   varchar(20),
   primary key (idEstadoRecinto)
);

/*==============================================================*/
/* Table: historialOcupamientoRecintos                          */
/*==============================================================*/
create table historialOcupamientoRecintos
(
   idHistorialOcupamientoRecinto int not null,
   idTipoRecinto        int not null,
   idRecinto            int not null,
   tipoOcupamiento      varchar(20) not null,
   fechaInicialOcupamientoRecinto date not null,
   horaInicialOcupamientoRecinto time not null,
   fechaFinalOcupamientoRecinto date not null,
   horaFinalOcupamientoRecinto time not null,
   primary key (idHistorialOcupamientoRecinto)
);

/*==============================================================*/
/* Table: historialPersonas                                     */
/*==============================================================*/
create table historialPersonas
(
   idEstadoPersona      int not null,
   idTipoOperacionPersona int not null,
   idPersona            int not null,
   idUsuario            int not null,
   idTipoRecinto        int not null,
   idRecinto            int not null,
   idHistorialPersona   int not null,
   fechaHistorialPersona date,
   horaHistorialPersona time,
   primary key (idTipoRecinto, idEstadoPersona, idTipoOperacionPersona, idPersona, idUsuario, idRecinto)
);

/*==============================================================*/
/* Table: historialRecintos                                     */
/*==============================================================*/
create table historialRecintos
(
   idTipoOperacionRecinto int not null,
   idEstadoRecinto      int not null,
   idTipoRecinto        int not null,
   idRecinto            int not null,
   idUsuario            int not null,
   idPersona            int not null,
   idHistorialRecinto   int not null,
   fechaHistorialRecinto date,
   horaHistorialRecinto time,
   primary key (idTipoRecinto, idTipoOperacionRecinto, idEstadoRecinto, idRecinto, idUsuario, idPersona)
);

/*==============================================================*/
/* Table: notificaciones                                        */
/*==============================================================*/
create table notificaciones
(
   idNotificacion       int not null,
   mensajeNotificacion  varchar(40),
   primary key (idNotificacion)
);

/*==============================================================*/
/* Table: personas                                              */
/*==============================================================*/
create table personas
(
   idPersona            int not null,
   rutPersona           varchar(10),
   nombresPersona       varchar(30),
   apellidopatermoPersona varchar(20),
   apellidomaternoPersona varchar(20),
   primary key (idPersona)
);

/*==============================================================*/
/* Table: recintos                                              */
/*==============================================================*/
create table recintos
(
   idTipoRecinto        int not null,
   idRecinto            int not null,
   idArea               int,
   recIdTipoRecinto     int,
   recIdRecinto         int,
   nombreRecinto        varchar(20),
   codigoVisual         varchar(20),
   primary key (idTipoRecinto, idRecinto)
);

/*==============================================================*/
/* Table: reservaRecintos                                       */
/*==============================================================*/
create table reservaRecintos
(
   idReservaRecinto     int not null,
   idUsuario            int not null,
   idHistorialOcupamientoRecinto int,
   idPersona            int,
   idTipoRecinto        int not null,
   idRecinto            int not null,
   fechaInicialOcupamientoRecinto date not null,
   horaInicialOcupamientoRecinto time not null,
   fechaFinalOcupamientoRecinto date,
   horaFinalOcupamientoRecinto time,
   primary key (idReservaRecinto)
);

/*==============================================================*/
/* Table: tipoAtributoAreas                                     */
/*==============================================================*/
create table tipoAtributoAreas
(
   idTipoAtributoArea   int not null,
   idArea               int not null,
   tipoAtributoArea     varchar(20),
   primary key (idTipoAtributoArea)
);

/*==============================================================*/
/* Table: tipoAtributoPersonas                                  */
/*==============================================================*/
create table tipoAtributoPersonas
(
   idTipoAtributoPersona int not null,
   idTipoPersona        int not null,
   tipoAtributoPersona  varchar(20),
   tipoDominioAtributoPersona char(10),
   primary key (idTipoAtributoPersona)
);

/*==============================================================*/
/* Table: tipoAtributoRecintos                                  */
/*==============================================================*/
create table tipoAtributoRecintos
(
   idTipoAtributosRecinto int not null,
   idTipoRecinto        int not null,
   tipoAtributoRecinto  varchar(20),
   dominioRecinto       varchar(20),
   primary key (idTipoAtributosRecinto)
);

/*==============================================================*/
/* Table: tipoEstadoPersonas                                    */
/*==============================================================*/
create table tipoEstadoPersonas
(
   idTipoEstadoPersona  int not null,
   tipoEstadoPersona    varchar(20),
   primary key (idTipoEstadoPersona)
);

/*==============================================================*/
/* Table: tipoEstadoRecintos                                    */
/*==============================================================*/
create table tipoEstadoRecintos
(
   idTipoEstadoRecinto  int not null,
   idTipoRecinto        int not null,
   tipoEstadoRecinto    varchar(20),
   primary key (idTipoEstadoRecinto)
);

/*==============================================================*/
/* Table: tipoOperacionPersonas                                 */
/*==============================================================*/
create table tipoOperacionPersonas
(
   idTipoOperacionPersona int not null,
   idTipoPersona        int not null,
   nombreTipoOperacionPersona varchar(20),
   primary key (idTipoOperacionPersona)
);

/*==============================================================*/
/* Table: tipoOperacionRecintos                                 */
/*==============================================================*/
create table tipoOperacionRecintos
(
   idTipoOperacionRecinto int not null,
   idTipoRecinto        int not null,
   nombreTipoOperacionRecinto varchar(20),
   primary key (idTipoOperacionRecinto)
);

/*==============================================================*/
/* Table: tipoPersonas                                          */
/*==============================================================*/
create table tipoPersonas
(
   idTipoPersona        int not null,
   nombreTipoPersona    varchar(20),
   primary key (idTipoPersona)
);

/*==============================================================*/
/* Table: tipoRecintos                                          */
/*==============================================================*/
create table tipoRecintos
(
   idTipoRecinto        int not null,
   nombreTipoRecinto    varchar(20),
   primary key (idTipoRecinto)
);

/*==============================================================*/
/* Table: tipoperClasificaPer                                   */
/*==============================================================*/
create table tipoperClasificaPer
(
   idTipoPersona        int not null,
   idPersona            int not null,
   primary key (idTipoPersona, idPersona)
);

/*==============================================================*/
/* Table: tipoperPresentaTipoestper                             */
/*==============================================================*/
create table tipoperPresentaTipoestper
(
   idTipoPersona        int not null,
   idTipoEstadoPersona  int not null,
   primary key (idTipoPersona, idTipoEstadoPersona)
);

/*==============================================================*/
/* Table: usuarioRecibeNotificacion                             */
/*==============================================================*/
create table usuarioRecibeNotificacion
(
   idUsuario            int not null,
   idNotificacion       int not null,
   primary key (idUsuario, idNotificacion)
);

/*==============================================================*/
/* Table: usuarios                                              */
/*==============================================================
create table usuarios
(
   idUsuario            int not null,
   idPersona            int not null,
   nombreUsuario        varchar(20) not null,
   passwordUsuario      varchar(20) not null,
   emailUsuario         varchar(30) not null,
   autorizacionUsuario  int,
   codigoSeguridadUsuario varchar(20),
   estadoCuentaUsuario  int not null,
   primary key (idUsuario)
);
*/
alter table areaPoseeAtrarea add constraint FK_aREAATRIBUTOAREA foreign key (idTipoAtributoArea, idAtributosArea)
      references atributoAreas (idTipoAtributoArea, idAtributosArea) on delete restrict on update restrict;

alter table areaPoseeAtrarea add constraint FK_aREAATRIBUTOAREA2 foreign key (idArea)
      references areas (idArea) on delete restrict on update restrict;

alter table areas add constraint FK_aREACONTIENEAREAS foreign key (areIdArea)
      references areas (idArea) on delete restrict on update restrict;

alter table asignacionPersonaRecintoAreas add constraint FK_aSIGNACIONPERSONARECINTOAREAS foreign key (idPersona)
      references personas (idPersona) on delete restrict on update restrict;

alter table asignacionPersonaRecintoAreas add constraint FK_aSIGNACIONPERSONARECINTOAREAS2 foreign key (idTipoRecinto, idRecinto)
      references recintos (idTipoRecinto, idRecinto) on delete restrict on update restrict;

alter table asignacionPersonaRecintoAreas add constraint FK_aSIGNACIONPERSONARECINTOAREAS3 foreign key (idArea)
      references areas (idArea) on delete restrict on update restrict;

alter table asignacionPersonaRecintoAreas add constraint FK_aSIGNACIONPERSONARECINTOAREAS4 foreign key (idUsuario)
      references usuarios (idUsuario) on delete restrict on update restrict;

alter table asignacionPersonaRecintoAreas add constraint FK_aSIGNACIONPERSONARECINTOAREAS5 foreign key (idHistorialOcupamientoRecinto)
      references historialOcupamientoRecintos (idHistorialOcupamientoRecinto) on delete restrict on update restrict;

alter table atributoAreas add constraint FK_tIPOATRAREACLASIFICAATRAREA foreign key (idTipoAtributoArea)
      references tipoAtributoAreas (idTipoAtributoArea) on delete restrict on update restrict;

alter table atributoPersonas add constraint FK_pERSONAATRIBUTOPERSONA foreign key (idPersona)
      references personas (idPersona) on delete restrict on update restrict;

alter table atributoPersonas add constraint FK_tIPOATRPERCLASIFICAATRPER foreign key (idTipoAtributoPersona)
      references tipoAtributoPersonas (idTipoAtributoPersona) on delete restrict on update restrict;

alter table atributoRecintos add constraint FK_rECPOSEEATRREC foreign key (idTipoRecinto, idRecinto)
      references recintos (idTipoRecinto, idRecinto) on delete restrict on update restrict;

alter table atributoRecintos add constraint FK_tIPOATRRECPOSEEATRREC foreign key (idTipoAtributosRecinto)
      references tipoAtributoRecintos (idTipoAtributosRecinto) on delete restrict on update restrict;

alter table estadoPersonas add constraint FK_pERPRESENTAESTPER foreign key (idPersona)
      references personas (idPersona) on delete restrict on update restrict;

alter table estadoPersonas add constraint FK_tIPOESTPERCLASIFICAESTPER foreign key (idTipoEstadoPersona)
      references tipoEstadoPersonas (idTipoEstadoPersona) on delete restrict on update restrict;

alter table estadoRecintos add constraint FK_rECPRESENTAESTREC foreign key (idTipoRecinto, idRecinto)
      references recintos (idTipoRecinto, idRecinto) on delete restrict on update restrict;

alter table estadoRecintos add constraint FK_tIPOESTRECPOSEEESTREC foreign key (idTipoEstadoRecinto)
      references tipoEstadoRecintos (idTipoEstadoRecinto) on delete restrict on update restrict;

alter table historialOcupamientoRecintos add constraint FK_rECPRESENTAHISOCUREC foreign key (idTipoRecinto, idRecinto)
      references recintos (idTipoRecinto, idRecinto) on delete restrict on update restrict;

alter table historialPersonas add constraint FK_hISTORIALPERSONAS foreign key (idEstadoPersona)
      references estadoPersonas (idEstadoPersona) on delete restrict on update restrict;

alter table historialPersonas add constraint FK_hISTORIALPERSONAS2 foreign key (idTipoOperacionPersona)
      references tipoOperacionPersonas (idTipoOperacionPersona) on delete restrict on update restrict;

alter table historialPersonas add constraint FK_hISTORIALPERSONAS3 foreign key (idPersona)
      references personas (idPersona) on delete restrict on update restrict;

alter table historialPersonas add constraint FK_hISTORIALPERSONAS4 foreign key (idUsuario)
      references usuarios (idUsuario) on delete restrict on update restrict;

alter table historialPersonas add constraint FK_hISTORIALPERSONAS5 foreign key (idTipoRecinto, idRecinto)
      references recintos (idTipoRecinto, idRecinto) on delete restrict on update restrict;

alter table historialRecintos add constraint FK_hISTORIALRECINTOS foreign key (idTipoOperacionRecinto)
      references tipoOperacionRecintos (idTipoOperacionRecinto) on delete restrict on update restrict;

alter table historialRecintos add constraint FK_hISTORIALRECINTOS2 foreign key (idEstadoRecinto)
      references estadoRecintos (idEstadoRecinto) on delete restrict on update restrict;

alter table historialRecintos add constraint FK_hISTORIALRECINTOS3 foreign key (idTipoRecinto, idRecinto)
      references recintos (idTipoRecinto, idRecinto) on delete restrict on update restrict;

alter table historialRecintos add constraint FK_hISTORIALRECINTOS4 foreign key (idUsuario)
      references usuarios (idUsuario) on delete restrict on update restrict;

alter table historialRecintos add constraint FK_hISTORIALRECINTOS5 foreign key (idPersona)
      references personas (idPersona) on delete restrict on update restrict;

alter table recintos add constraint FK_aREACLASIFICAREC foreign key (idArea)
      references areas (idArea) on delete restrict on update restrict;

alter table recintos add constraint FK_rECCONTIENEREC foreign key (recIdTipoRecinto, recIdRecinto)
      references recintos (idTipoRecinto, idRecinto) on delete restrict on update restrict;

alter table recintos add constraint FK_tIPORECCLASIFICAREC foreign key (idTipoRecinto)
      references tipoRecintos (idTipoRecinto) on delete restrict on update restrict;

alter table reservaRecintos add constraint FK_pERSONAPOSEERESERVARECINTO foreign key (idPersona)
      references personas (idPersona) on delete restrict on update restrict;

alter table reservaRecintos add constraint FK_rECINTOPRESENTARESERVARESINTO foreign key (idTipoRecinto, idRecinto)
      references recintos (idTipoRecinto, idRecinto) on delete restrict on update restrict;

alter table reservaRecintos add constraint FK_rESRECREGISTRAHISOCUREC foreign key (idHistorialOcupamientoRecinto)
      references historialOcupamientoRecintos (idHistorialOcupamientoRecinto) on delete restrict on update restrict;

alter table reservaRecintos add constraint FK_uSUARIOREVISARESERVARECINTO foreign key (idUsuario)
      references usuarios (idUsuario) on delete restrict on update restrict;

alter table tipoAtributoAreas add constraint FK_aREAPOSEETIPOATRAREA foreign key (idArea)
      references areas (idArea) on delete restrict on update restrict;

alter table tipoAtributoPersonas add constraint FK_tIPOPERPOSEETIPOATRPER foreign key (idTipoPersona)
      references tipoPersonas (idTipoPersona) on delete restrict on update restrict;

alter table tipoAtributoRecintos add constraint FK_tIPORECPOSEETIPOATRREC foreign key (idTipoRecinto)
      references tipoRecintos (idTipoRecinto) on delete restrict on update restrict;

alter table tipoEstadoRecintos add constraint FK_tIPORECPOSEETIPOESTREC foreign key (idTipoRecinto)
      references tipoRecintos (idTipoRecinto) on delete restrict on update restrict;

alter table tipoOperacionPersonas add constraint FK_tIPOPERREALIZAOPEPER foreign key (idTipoPersona)
      references tipoPersonas (idTipoPersona) on delete restrict on update restrict;

alter table tipoOperacionRecintos add constraint FK_tIPORECREALIZAOPEREC foreign key (idTipoRecinto)
      references tipoRecintos (idTipoRecinto) on delete restrict on update restrict;

alter table tipoperClasificaPer add constraint FK_pERSONATIPOPERSONA foreign key (idTipoPersona)
      references tipoPersonas (idTipoPersona) on delete restrict on update restrict;

alter table tipoperClasificaPer add constraint FK_pERSONATIPOPERSONA2 foreign key (idPersona)
      references personas (idPersona) on delete restrict on update restrict;

alter table tipoperPresentaTipoestper add constraint FK_tIPOPERPRESENTATIPOESTPER foreign key (idTipoPersona)
      references tipoPersonas (idTipoPersona) on delete restrict on update restrict;

alter table tipoperPresentaTipoestper add constraint FK_tIPOPERPRESENTATIPOESTPER2 foreign key (idTipoEstadoPersona)
      references tipoEstadoPersonas (idTipoEstadoPersona) on delete restrict on update restrict;

alter table usuarioRecibeNotificacion add constraint FK_uSUARIONOTIFICACION foreign key (idUsuario)
      references usuarios (idUsuario) on delete restrict on update restrict;

alter table usuarioRecibeNotificacion add constraint FK_uSUARIONOTIFICACION2 foreign key (idNotificacion)
      references notificaciones (idNotificacion) on delete restrict on update restrict;

alter table usuarios add constraint FK_pERSONAUSUARIO foreign key (idPersona)
      references personas (idPersona) on delete restrict on update restrict;

