import { IoMdAddCircle } from "react-icons/io";
import { IoMdCloseCircle } from "react-icons/io";

import Modal from "../../components/Modal";
import CardInforme from "../../components/membresias/CardInforme";
import TablaCompras from "../../components/membresias/TablaCompras";
import TablaMembresias from "../../components/membresias/TablaMembresias";
import FormRegistro from "../../components/membresias/FormRegistro";
import FormUpdate from "../../components/membresias/FormUpdate";

import { useEffect, useState } from "react";
import clienteAxios from "../../config/axios";

const Membresias = () => {
  const [membresias, setMembresias] = useState([]);
  const [activeModal, setActiveModal] = useState(null);
  const [tablaDatos, setTablaDatos] = useState("");

  const formatoPrecio = new Intl.NumberFormat("es-MX", {
    style: "currency",
    currency: "MXN",
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  });

  const openModal = (modalName) => {
    setActiveModal(modalName);
  };
  const typeTable = (type) =>
    setTablaDatos((prev) => (prev === type ? "" : type));

  const closeModal = () => setActiveModal(null);

  useEffect(() => {
    const getMembresias = async () => {
      try {
        const { data } = await clienteAxios.get("/membresia/");
        setMembresias(data);
      } catch (error) {
        console.error("Error al obtener membresias", error);
        setMembresias([]);
      } 
    };
    getMembresias();
  }, []);
  return (
    <div className="p-5">
      <div className="p-4 flex justify-between items-center">
        <h1 className="text-3xl font-bold">
          <span className="text-gray-600">Lista /</span> Membresias
        </h1>
        <button
          className="text-lg bg-gray-800 text-white px-2 py-1 rounded-md hover:bg-black transform duration-300 flex items-center gap-2 "
          onClick={() => openModal("registrar")}
        >
          <IoMdAddCircle />
          Agregar
        </button>
      </div>

      <div className="grid grid-cols-3 gap-4 ">
        <CardInforme typeTable={typeTable} />
      </div>
      {/* Tablas informes */}
      {tablaDatos === "" && (
        <TablaMembresias
          openModal={openModal}
          membresias={membresias}
          formatoPrecio={formatoPrecio}
        />
      )}
      {tablaDatos !== "" && (
        <TablaCompras tipo={tablaDatos} openModal={openModal} />
      )}

      {/* Modal de agregar productos */}
      {activeModal === "registrar" && (
        <Modal closeModal={closeModal}>
          <div className="flex justify-between pb-3">
            <h2 className="text-2xl font-semibold">Agregar membresia</h2>
            <button className="text-red-700" onClick={closeModal}>
              <IoMdCloseCircle className="text-3xl" />
            </button>
          </div>
          <FormRegistro />
        </Modal>
      )}
      {/* Modal de registro */}
      {activeModal === "editar" && (
        <Modal closeModal={closeModal}>
          <div className="flex justify-between pb-3">
            <h2 className="text-2xl font-semibold">Editar membresia</h2>
            <button className="text-red-700" onClick={closeModal}>
              <IoMdCloseCircle className="text-3xl" />
            </button>
          </div>

          <FormUpdate />
        </Modal>
      )}
    </div>
  );
};

export default Membresias;
