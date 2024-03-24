/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package vista;

import java.awt.Color;
import modelo.EstadoMotor;
import modelo.Objetivo;

/**
 *
 * @author anean
 */
public class Salpicadero extends javax.swing.JFrame {

    /**
     * Creates new form Salpi
     */
    public Salpicadero() {
        initComponents();
        this.setVisible(true);
        repaint();
        revalidate();
        
        this.encen_apag.setText("ENCENDER");
        this.frena.setText("FRENAR");
        this.acelera.setText("ACELERAR");
        this.encen_apag.setForeground(Color.green);
        this.panelcito.setText(EstadoMotor.APAGADO.toString());
        
        this.vel.setText("0.0");        
        this.kms.setText("0.0");
        this.rev.setText("0.0");

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        encen_apag = new javax.swing.JToggleButton();
        acelera = new javax.swing.JToggleButton();
        frena = new javax.swing.JToggleButton();
        velocímetroLabel = new javax.swing.JLabel();
        velLabel = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        panelcito = new javax.swing.JTextArea();
        CuentaKmLabel = new javax.swing.JLabel();
        kmLabel = new javax.swing.JLabel();
        CuentaRevoLabel = new javax.swing.JLabel();
        revLabel = new javax.swing.JLabel();
        mandosLabel = new javax.swing.JLabel();
        kms = new javax.swing.JLabel();
        vel = new javax.swing.JLabel();
        rev = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        encen_apag.setText("jToggleButton1");
        encen_apag.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                encen_apagActionPerformed(evt);
            }
        });

        acelera.setText("jToggleButton2");

        frena.setText("jToggleButton3");
        frena.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                frenaActionPerformed(evt);
            }
        });

        velocímetroLabel.setText("Velocimetro");

        velLabel.setText("Km/h");

        panelcito.setEditable(false);
        panelcito.setColumns(20);
        panelcito.setRows(5);
        panelcito.setAutoscrolls(false);
        jScrollPane2.setViewportView(panelcito);

        CuentaKmLabel.setText("Cuenta Kilómetros");

        kmLabel.setText("Km");

        CuentaRevoLabel.setText("Cuenta Revoluciones");

        revLabel.setText("RPM");

        mandosLabel.setText("Mandos");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(encen_apag, javax.swing.GroupLayout.PREFERRED_SIZE, 105, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(acelera, javax.swing.GroupLayout.PREFERRED_SIZE, 103, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(frena, javax.swing.GroupLayout.PREFERRED_SIZE, 103, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 336, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(velocímetroLabel)))
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(CuentaKmLabel)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(CuentaRevoLabel)
                    .addComponent(mandosLabel)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(77, 77, 77)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(rev, javax.swing.GroupLayout.PREFERRED_SIZE, 72, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(revLabel))))
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(layout.createSequentialGroup()
                .addGap(83, 83, 83)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(kmLabel)
                        .addContainerGap(276, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(vel, javax.swing.GroupLayout.PREFERRED_SIZE, 72, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(kms, javax.swing.GroupLayout.PREFERRED_SIZE, 72, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(velLabel))
                        .addGap(0, 0, Short.MAX_VALUE))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(26, 26, 26)
                .addComponent(velocímetroLabel)
                .addGap(11, 11, 11)
                .addComponent(velLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(vel, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(38, 38, 38)
                .addComponent(CuentaKmLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(kmLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(kms, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(27, 27, 27)
                .addComponent(CuentaRevoLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(revLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(rev, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 46, Short.MAX_VALUE)
                .addComponent(mandosLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(encen_apag, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(frena, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(acelera, javax.swing.GroupLayout.PREFERRED_SIZE, 57, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(19, 19, 19))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void encen_apagActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_encen_apagActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_encen_apagActionPerformed

    private void frenaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_frenaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_frenaActionPerformed

     public void actualiza(Objetivo ob){
        
        
        if(this.encen_apag.isSelected()){
            this.encen_apag.setForeground(Color.red);
            this.encen_apag.setText("APAGAR");
            this.panelcito.setText(EstadoMotor.ENCENDIDO.toString());
            
            if(this.acelera.isSelected()){
                this.acelera.setForeground(Color.red);
                this.acelera.setText("Soltar acelerador");
                this.panelcito.setText(EstadoMotor.ACELERANDO.toString());
                
                this.frena.setEnabled(false);
            } else {
                this.frena.setEnabled(true);
                if(this.frena.isSelected()){
                    this.frena.setForeground(Color.red);
                    this.frena.setText("Soltar freno");
                    this.panelcito.setText(EstadoMotor.FRENANDO.toString());
                     this.acelera.setEnabled(false);
                }
                else{
                    this.frena.setForeground(Color.DARK_GRAY);                
                    this.acelera.setForeground(Color.DARK_GRAY);

                    this.frena.setText("FRENAR");
                    this.acelera.setText("ACELERAR");
                    
                    this.acelera.setEnabled(true);
                    this.frena.setEnabled(true);
                }
            }
        }else{
            this.encen_apag.setText("ENCENDER");
            this.encen_apag.setForeground(Color.green);
            this.panelcito.setText(EstadoMotor.APAGADO.toString());
            
        }

        this.velocimetro(ob);
        this.cuentaKilometros(ob);
        this.cuentaRevoluciones(ob);

        repaint();
        revalidate();
    }
    public EstadoMotor getEstado(){
        if(this.encen_apag.isSelected()){
            if(this.acelera.isSelected()){
                return EstadoMotor.ACELERANDO;
            }
            else if(this.frena.isSelected()){
                return EstadoMotor.FRENANDO;
            }
            else{
                return EstadoMotor.ENCENDIDO;
            }
        }
        else{
            return EstadoMotor.APAGADO;
        }
    }
    public void velocimetro(Objetivo ob){
        String vel = String.valueOf(ob.getVelocidad_lineal());
        this.vel.setText(vel);
    }
    
    public void cuentaKilometros(Objetivo ob){
        String km = String.valueOf(ob.getDistancia());
        this.kms.setText(km);
    }
    
    public void cuentaRevoluciones(Objetivo ob){
        String rev = String.valueOf(ob.getRevoluciones());
        this.rev.setText(rev);
    }
    
    

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel CuentaKmLabel;
    private javax.swing.JLabel CuentaRevoLabel;
    private javax.swing.JToggleButton acelera;
    private javax.swing.JToggleButton encen_apag;
    private javax.swing.JToggleButton frena;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JLabel kmLabel;
    private javax.swing.JLabel kms;
    private javax.swing.JLabel mandosLabel;
    private javax.swing.JTextArea panelcito;
    private javax.swing.JLabel rev;
    private javax.swing.JLabel revLabel;
    private javax.swing.JLabel vel;
    private javax.swing.JLabel velLabel;
    private javax.swing.JLabel velocímetroLabel;
    // End of variables declaration//GEN-END:variables
}
