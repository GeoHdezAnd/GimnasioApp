import { MdDelete } from "react-icons/md";
import { RiFileExcel2Fill } from "react-icons/ri";
import { HiSearchCircle } from "react-icons/hi";
import { BsEyeFill } from "react-icons/bs";

import MenuExport from "../ui/MenuExport";

import { useState } from "react";
import { format } from "date-fns";
import { es } from "date-fns/locale"; // Importamos el idioma español
import InformeVentaProducto from "./InformeVentaProducto";

const ProductosVentas = () => {
  const [optionsExport, setOptionsExport] = useState(null);
  const [deleteVenta, setDeleteVenta] = useState(false);
  const [activeModal, setActiveModal] = useState(null);

  const openModalVenta = (id) => {
    setActiveModal(id);
  }
  const closeModal = () => setActiveModal(null);
  const toggleOptionsExport = () => {
    setOptionsExport((prev) => !prev);
  };
  const handleDownload = async () => {
    console.log("Descargando.....");
  };
  const handleSendReport = async () => {
    console.log("Enviando.....");
  };
  const toggleDelete = (id) => {
    setDeleteVenta(id);
  };
  const cancelDelete = () => {
    setDeleteVenta(null); // Cancelar la eliminación
  };

  const confirmDelete = () => {
    // Aquí puedes agregar la lógica para eliminar el cliente
    console.log(`Venta con id ${deleteVenta} eliminado.`);
    setDeleteVenta(null); // Reiniciar el estado
  };
  const datosSimulados = [
    {
      id: 1,
      fotoCliente: "https://via.placeholder.com/40", // Imagen de perfil simulada
      nombreCliente: "Juan Pérez",
      telefono: "555-123-4567",
      precio: 200.0,
      productos: ["Mancuernas", "Proteína en polvo"],
      fechaCompra: "2024-12-15",
      total: 400.0,
    },
    {
      id: 2,
      fotoCliente: "https://via.placeholder.com/40",
      nombreCliente: "Ana López",
      telefono: "555-765-4321",
      precio: 150.0,
      productos: ["Colchoneta", "Banda elástica"],
      fechaCompra: "2024-12-18",
      total: 300.0,
    },
    {
      id: 3,
      fotoCliente: "https://via.placeholder.com/40",
      nombreCliente: "Carlos Ruiz",
      telefono: "555-987-6543",
      precio: 100.0,
      productos: ["Cuerda para saltar", "Pesas tobilleras"],
      fechaCompra: "2024-12-20",
      total: 200.0,
    },
    {
      id: 4,
      fotoCliente: "https://via.placeholder.com/40",
      nombreCliente: "Sofía Martínez",
      telefono: "555-321-0987",
      precio: 300.0,
      productos: ["Bicicleta estática", "Toalla deportiva"],
      fechaCompra: "2024-12-21",
      total: 600.0,
    },
    {
      id: 5,
      fotoCliente: "https://via.placeholder.com/40",
      nombreCliente: "Miguel Torres",
      telefono: "555-654-3210",
      precio: 250.0,
      productos: ["Proteína vegetal", "Termo"],
      fechaCompra: "2024-12-22",
      total: 500.0,
    },
  ];
  return (
    <>
      <main>
        <h1 className="text-2xl font-semibold">Productos</h1>
        <div className="my-4 p-3 bg-white rounded-lg">
          <div className="p-2 grid md:grid-cols-5 gap-2 md:gap-5">
            <div className=" grid grid-cols-3 items-center md:flex  justify-between">
              <div className="col-span-2 gap-2 ">
                <h1 className="font-bold text-xl">Total de ventas</h1>
                <p>300</p>
              </div>

              <div className="flex md:hidden w-full md:w-0 items-center">
                <button className="w-full m-2 bg-black rounded-lg text-white hover:bg-red-900  hover:scale-110 p-2 transition-all duration-300">
                  <RiFileExcel2Fill className="m-auto text-2xl" />
                </button>
              </div>
            </div>

            <div className=" md:col-span-3 my-auto">
              <form className="flex">
                <input
                  type="text"
                  placeholder="Buscar tipo membresia..."
                  className="w-full px-4 py-2 border border-gray-300 rounded-2xl shadow-sm focus:outline-none focus:ring-1 focus:ring-zinc-600 focus:border-zinc-800"
                />
                <button
                  type="button"
                  className=" inset-y-0 right-0 flex -ml-5 items-center px-4 text-white bg-zinc-700 rounded-r-lg hover:bg-zinc-800 focus:ring-2 focus:ring-zinc-300"
                >
                  <HiSearchCircle className="text-2xl" />
                </button>
              </form>
            </div>
            <div className="hidden md:flex justify-center divide-x-4 h-auto items-center ">
              <button
                onClick={toggleOptionsExport}
                type="button"
                className="scale-hover-10 gap-3 rounded-lg px-3 py-1 bg-black flex text-white justify-center items-center hover:bg-red-600"
              >
                <RiFileExcel2Fill /> Exportar
              </button>
              {/* Recuadro con opciones de exportación */}
              {optionsExport && (
                <MenuExport
                  onDownload={handleDownload}
                  onSendReport={handleSendReport}
                />
              )}
            </div>
          </div>
          <div className="overflow-x-auto">
            <table className="min-w-full border border-gray-200 divide-y divide-gray-300 ">
              <thead className="bg-gray-100 text-xs ">
                <tr className="text-center">
                  <th className="px-5 py-2 text-gray-700 uppercase">#</th>
                  <th className="px-5 py-2 text-gray-700 uppercase">
                    Foto cliente
                  </th>
                  <th className="px-5 py-2 text-gray-700 uppercase">
                    Nombre cliente
                  </th>
                  <th className="px-5 py-2 text-gray-700 uppercase">
                    Número de telefono
                  </th>
                  <th className="px-5 py-2 text-gray-700 uppercase">Precio</th>

                  <th className="px-5 py-2 text-gray-700 uppercase">
                    Productos
                  </th>

                  <th className="px-5 py-2 text-gray-700 uppercase">
                    Fecha de compra
                  </th>
                  <th className="px-5 py-2 text-gray-700 uppercase">Total</th>
                  <th className="px-5 py-2 text-gray-700 uppercase">
                    Acciones
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200 font-medium text-center items-center">
                {datosSimulados.map((venta, index) => (
                  <tr key={venta.id} className="hover:bg-gray-100">
                    <td className="px-6 py-4 text-sm text-gray-700">
                      {index + 1}
                    </td>
                    <td className="px-6 py-4 text-sm text-gray-700">
                      <img
                        src={venta.fotoCliente}
                        alt="Foto cliente"
                        className="w-10 h-10 rounded-full ring-2 ring-red-800 m-auto"
                      />
                    </td>
                    <td className="px-6 py-4 text-sm text-gray-700">
                      {venta.nombreCliente}
                    </td>
                    <td className="px-6 py-4 text-sm text-gray-700">
                      {venta.telefono}
                    </td>
                    <td className="px-6 py-4 text-sm text-gray-700">
                      ${venta.precio.toFixed(2)}
                    </td>
                    <td className="px-6 py-4 text-sm text-gray-700">
                      <ul className="list-disc">
                        {venta.productos.map((producto, i) => (
                          <li key={i}>{producto}</li>
                        ))}
                      </ul>
                    </td>
                    <td className="px-6 py-4 text-sm text-gray-700">
                    {format(
                        new Date(venta.fechaCompra),
                        "dd 'de' MMMM, yyyy",
                        { locale: es }
                      )}
                    </td>
                    <td className="px-6 py-4 text-sm text-gray-700">
                      ${venta.total.toFixed(2)}
                    </td>
                    <td className="px-6 flex gap-3 py-4 text-sm text-gray-700">
                    <button
                        className="text-cyan-500 hover:text-cyan-700 transition-colors duration-300"
                        onClick={() => openModalVenta(venta.id)}
                      >
                        <BsEyeFill  className="text-3xl scale-hover" />
                      </button>
                      {activeModal === venta.id && (
                        <InformeVentaProducto closeModal={closeModal} />
                      )}
                      <button
                        className="text-rose-400 hover:text-rose-700 transition-colors duration-300"
                        onClick={() => toggleDelete(venta.id)}
                      >
                        <MdDelete className="text-3xl scale-hover" />
                      </button>
                      {/* Muestra recuadro de confirmacion */}
                      {deleteVenta === venta.id && (
                        <div className="absolute  mt-2 bg-white border rounded-lg shadow-lg w-56 z-10 p-4   right-10">
                          <h1 className="text-lg font-semibold text-gray-700 mb-2">
                            ¿Seguro que deseas eliminar la venta de <br />
                            <span className="font-bold">{venta.nombreCliente}</span>?
                          </h1>
                          <div className="flex justify-between">
                            <button
                              className="bg-gray-200 text-gray-700 py-1 px-3 rounded hover:bg-gray-300"
                              onClick={cancelDelete}
                            >
                              Cancelar
                            </button>
                            <button
                              className="bg-rose-500 text-white py-1 px-3 rounded hover:bg-rose-600"
                              onClick={confirmDelete}
                            >
                              Eliminar
                            </button>
                          </div>
                        </div>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </main>
    </>
  );
};

export default ProductosVentas;