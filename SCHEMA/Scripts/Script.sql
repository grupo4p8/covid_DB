CREATE TABLE pais 
(
	pais_id INT NOT NULL PRIMARY KEY,
	pais_nombre VARCHAR(30) NOT NULL

)

CREATE TABLE vacuna 
(
	vacuna_id INT NOT NULL PRIMARY KEY,
	vacuna_nombre VARCHAR(20) NOT NULL

)

CREATE TABLE tipo_documento 
(
	docum_tipo_id INT NOT NULL PRIMARY KEY,
	docum_tipo VARCHAR(25) NOT NULL

)

---WITH FK---

CREATE TABLE persona 
(
	psn_id INT NOT NULL PRIMARY KEY,
	docum_tipo_id_fk INT NOT NULL,
	psn_docum_numero INT NOT NULL,
	psn_nombres VARCHAR(50) NOT NULL,
	psn_apellidos VARCHAR(50) NOT NULL,
	psn_fecha_nto DATE NOT NULL,
	psn_genero VARCHAR(2) NOT NULL,
	vacuna_aplicada_id_fk INT NOT null,
	FOREIGN KEY (docum_tipo_id_fk) REFERENCES tipo_documento(docum_tipo_id),
	FOREIGN KEY (vacuna_aplicada_id_fk) REFERENCES vacuna(vacuna_id)
)

CREATE TABLE vacuna_aceptada (
	vacuna_aceptada_id INT NOT NULL PRIMARY KEY,
	pais_id_fk INT NOT NULL,
	vacuna_id_fk INT NOT NULL,
	FOREIGN KEY (pais_id_fk) REFERENCES pais(pais_id),
	FOREIGN KEY (vacuna_id_fk) REFERENCES vacuna(vacuna_id)

)

CREATE TABLE solicitud_permiso 
(
	permiso_id INT NOT NULL PRIMARY KEY,
	permiso_fecha DATE NOT NULL,
	psn_cc_fk INT NOT NULL,
	pais_id_fk INT NOT NULL,
	--change bit to boolean , sql server--->> mysql postgres--
	resultado_prueba BOOLEAN NOT NULL,
	permiso_autorizado BOOLEAN NOT NULL,




	FOREIGN KEY (psn_cc_fk) REFERENCES persona(psn_id),
	FOREIGN KEY (pais_id_fk) REFERENCES pais(pais_id)

)

SELECT * FROM pais,persona