package esgi.java.advanced.ui.desktop.app.model;

public class Facture {


    private int prix;
    private String typeDePaimentt;
    private String client;
    private String prestatire;
    private String misssion ;


    public Facture(int prix , String typeDePaimentt,String client,String prestatire, String misssion ){
        this.prix= prix;
        this.typeDePaimentt= typeDePaimentt;
        this.client= client;
        this.prestatire= prestatire;
        this.misssion= misssion;

    }


    public int getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
        this.prix = prix;
    }

    public String getTypeDePaimentt() {
        return typeDePaimentt;
    }

    public void setTypeDePaimentt(String typeDePaimentt) {
        this.typeDePaimentt = typeDePaimentt;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public String getPrestatire() {
        return prestatire;
    }

    public void setPrestatire(String prestatire) {
        this.prestatire = prestatire;
    }

    public String getMisssion() {
        return misssion;
    }

    public void setMisssion(String misssion) {
        this.misssion = misssion;
    }

    @Override
    public String toString() {
        return "Facture{" +
                "prix=" + prix +
                ", typeDePaimentt='" + typeDePaimentt + '\'' +
                ", client='" + client + '\'' +
                ", prestatire='" + prestatire + '\'' +
                ", misssion='" + misssion + '\'' +

                '}';
    }


}
