import { FaFilter } from "react-icons/fa";
import { HiSearchCircle } from "react-icons/hi";
import { RiFileExcel2Fill } from "react-icons/ri";
import { MdDelete } from "react-icons/md";
import { BsPencilFill } from "react-icons/bs";
import PropTypes from "prop-types"
import { useState } from "react";
import ToggleSwitch from "../ui/ToggleSwitch";
const TablaMembresias = ({openModal}) => {
  const [deleteMembresia, setDeleteMembresia] = useState(false);

  const handleAvaliable = (newValue) => {
    /* AQUI CREAMOS LA FUNCION PARA ENVIAR EL NUEVO ESTADO DE DISPONIBILIDAD DEBEMOS RECIBIR EL ID DE LA MEMBRESIA Y EL ESTADO PARA MANDAR LOS CAMBIOS A LA BASE abajo hay un ejemplo de como hacer esa actualizacion del dato, aun falta recibir id en esta funcion recuerda*/
    // const updatedData = data.map((membership) =>
    //     membership.id === id
    //       ? { ...membership, disponible: newValue }
    //       : membership
    //   );
    console.log(newValue)
  }
  const toggleDelete = () => {
    setDeleteMembresia(true);
  };
  return (
    <>
      <div className="my-4 p-3 bg-white rounded-lg">
        <div className="p-2 grid md:grid-cols-4  md:gap-5">
          <div className=" grid grid-cols-3 items-center md:flex  justify-between">
            <h1 className="col-span-2 gap-2 font-bold text-xl">
              Tipos membresia
            </h1>

            <div className="flex md:hidden w-full md:w-0 items-center">
              <button className="w-full p-1 hover:bg-slate-900 hover:bg-opacity-25 hover:scale-125 transition-all duration-300">
                <RiFileExcel2Fill className="m-auto text-2xl " />
              </button>
              <button className="w-full p-1 hover:bg-slate-900 hover:bg-opacity-25 hover:scale-125 transition-all duration-300">
                <FaFilter className="m-auto text-2xl" />
              </button>
            </div>
          </div>

          <div className=" md:col-span-2 my-auto">
            <form className="flex">
              <input
                type="text"
                placeholder="Buscar usuario..."
                className="w-full px-4 py-2 border border-gray-300 rounded-2xl shadow-sm focus:outline-none focus:ring-1 focus:ring-zinc-600 focus:border-zinc-800"
              />
              <button
                type="submit"
                className=" inset-y-0 right-0 flex -ml-5 items-center px-4 text-white bg-zinc-700 rounded-r-lg hover:bg-zinc-800 focus:ring-2 focus:ring-zinc-300"
              >
                <HiSearchCircle className="text-2xl" />
              </button>
            </form>
          </div>
          <div className="hidden md:flex h-auto items-center text-lg">
            <button className="scale-hover-10 w-full gap-2 px-3 border-r-2 border-gray-900 flex  justify-center items-center hover:bg-zinc-600 hover:bg-opacity-20">
              <RiFileExcel2Fill /> Exportar
            </button>
            <button className="scale-hover-10 w-full gap-2 px-3 flex  justify-center items-center hover:bg-zinc-600 hover:bg-opacity-20">
              <FaFilter />
              Filtro
            </button>
          </div>
        </div>
        <div className="overflow-x-auto">
          <table className="min-w-full border border-gray-200 divide-y divide-gray-300 ">
            <thead className="bg-gray-100 text-xs ">
              <tr className="text-center">
                <th className="px-5 py-2 text-gray-700 uppercase">#</th>
                <th className="px-5 py-2 text-gray-700 uppercase">Tipo</th>
                <th className="px-5 py-2 text-gray-700 uppercase">
                  Beneficios
                </th>
                <th className="px-5 py-2 text-gray-700 uppercase">
                  Días de duración
                </th>
                <th className="px-5 py-2 text-gray-700 uppercase">Precio</th>
                <th className="px-5 py-2 text-gray-700 uppercase">Descuento</th>
                <th className="px-5 py-2 text-gray-700 uppercase">Total</th>

                <th className="px-5 py-2 text-gray-700 uppercase">
                  Disponible
                </th>
                

                <th className="px-5 py-2 text-gray-700 uppercase">Acciones</th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-200 font-medium text-center items-center">
              <tr key={1} className="hover:bg-gray-100 ">
                <td className="px-6 py-4 text-sm  text-gray-700">
                  <p>1</p>
                </td>

                <td className="px-6 py-4 text-sm  text-gray-700">
                  <p>Basica</p>
                </td>
                <td className="px-6 py-4 text-sm  text-gray-700">
                  <ul className="list-disc">
                    <li>Acceso al gym</li>
                    <li>Atención de entrenadores</li>
                  </ul>
                </td>
                <td className="px-6 py-4 text-sm  text-gray-700">
                  <p>30</p>
                </td>
                <td className="px-6 py-4 text-sm text-gray-700">
                    <p>
                    <span>$</span>400.00
                  </p>
                </td>
                <td className="px-6 py-4 text-sm text-gray-700">
                <p>
                    <span>$</span>100.00
                  </p>
                </td>
                <td className="px-6 py-4 text-sm text-gray-700">
                <p>
                    <span>$</span>300.00
                  </p>
                </td>
                
                <td className="px-6 py-4 text-sm  text-gray-700">
                    {/*Este es el boton para decir si está disponible o no, en onToggle, enviamos el valor de newValue para poder ejecutar el handleToggle en el parent component y que haga la validacion dentro de esa funcion, dentro de esa funcion se ejecutara handleAvaliable que esta aqui para cambiar la DB */}
                  <ToggleSwitch avaliable={true} onToggle={(newValue) =>{ handleAvaliable(newValue)}} />
                </td>
                <td className="px-6 py-4 text-sm text-gray-700 h-full">
                  <div className="flex items-center justify-center gap-4 h-full">
                  <button
                      className=" text-yellow-400 hover:text-yellow-600 transition-colors duration-300"
                      onClick={() => {
                        openModal("editar");
                      }}
                    >
                      <BsPencilFill  className="text-2xl scale-hover" />
                    </button>
                    <button
                      className="text-rose-400 hover:text-rose-700 transition-colors duration-300"
                      onClick={() => {
                        toggleDelete("1");
                      }}
                    >
                      <MdDelete className="text-3xl scale-hover"  />
                    </button>
                    {/* Muestra recuadro de confirmacion */}
                    {deleteMembresia && (
                      <div className="absolute  mt-2 bg-white border rounded-lg shadow-lg w-56 z-10 p-4   right-10">
                        <h1 className="text-lg font-semibold text-gray-700 mb-2">
                          ¿Seguro que deseas eliminar a <br />
                          <span className="font-bold"></span>?
                        </h1>
                        <div className="flex justify-between">
                          <button
                            className="bg-gray-200 text-gray-700 py-1 px-3 rounded hover:bg-gray-300"
                            onClick={() => setDeleteMembresia(false)}
                          >
                            Cancelar
                          </button>
                          <button
                            className="bg-rose-500 text-white py-1 px-3 rounded hover:bg-rose-600"
                            onClick={() => {
                              //   handleDelete();
                              //   setDeleteCliente(null);
                            }}
                          >
                            Eliminar
                          </button>
                        </div>
                      </div>
                    )}
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </>
  );
};

TablaMembresias.propTypes = {
  openModal: PropTypes.func
}
export default TablaMembresias;