package utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class DBUtils {
    static Connection connection;
    static ResultSet resultSet;

    // This method creates a connection to the database
    // @return connection

    public static Connection getConnection(){
        try {
             connection=DriverManager.getConnection(ConfigReader.getPropertyValue("dbUrl"),
                    ConfigReader.getPropertyValue("dbUsername"),
                    ConfigReader.getPropertyValue("dbPassword"));


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
        /**
         * This method gets result object from specified sql query
         * @param
         * @return

         */
    }
    public static ResultSet getResultSet(String sglQuery){
        try {
            resultSet=getConnection().createStatement().executeQuery(sglQuery);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }
    /**This method will returns data from resultset object
     * @param sglQuery
     * @return List<Map<K,  V>>
     *

     */
    public static List<Map<String, String>> listOfMapsFromDb(String sglQuery){
        List<Map<String, String>> listOfRowMaps =new ArrayList<>();
        Map<String,String> rowMap;
        try {
            resultSet=getResultSet(sglQuery);
            ResultSetMetaData rsMetaData=resultSet.getMetaData();


            while (resultSet.next()){
                rowMap=new LinkedHashMap<>();
                for (int i = 1; i <=rsMetaData.getColumnCount() ; i++) {
                    rowMap.put(rsMetaData.getColumnName(i), resultSet.getString(i));

                }
                listOfRowMaps.add(rowMap);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listOfRowMaps;
    }
    /**
     * This method returns data from ResultSet object in a form of single Map
     * @param sglQuery
     * @return Map<K, V)
     */
    public static Map<String, String> mapFromDb(String sglQuery){
        Map<String, String> rowMap=new LinkedHashMap<>();

        try {
            resultSet=getResultSet(sglQuery);
            ResultSetMetaData rsMetaData=resultSet.getMetaData();

            resultSet.next();
            for(int i = 1; i <=rsMetaData.getColumnCount() ; i++){
                rowMap.put(rsMetaData.getColumnName(i),resultSet.getString(i));

            }



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowMap;


    }
}

