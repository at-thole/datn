class SearchsController < ApplicationController
  def index
  end

  def create
    city = params[:search][:city]
    topic = params[:search][:topic]
    content = params[:search][:content]
    query = Tripod::SparqlClient::Query.query("PREFIX untitled-ontology-44: <http://www.semanticweb.org/tho/ontologies/2017/4/untitled-ontology-44#>
      SELECT * {
        ?x untitled-ontology-44:Id_Dia_Diem ?id.
        ?x untitled-ontology-44:Thuoc untitled-ontology-44:" + "#{city}" ".
        ?x untitled-ontology-44:Co_Noi_Dung untitled-ontology-44:" + "#{content}" ".
        ?x untitled-ontology-44:Co_Chu_De untitled-ontology-44:" + "#{topic}" ".
      }", nil)
    result = JSON.parse query
    @id_result = result["results"]["bindings"].map do |result|
      result["id"]["value"]
    end
    @travel_places = TravelPlace.where id: [@id_result]
    respond_to do |format|
      format.js
    end
  end
end
