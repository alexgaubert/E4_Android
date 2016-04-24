package com.ppe4.starsup;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.List;

/**
 * Created by Alex on 24/04/2016.
 */
public class VisiteAdapter extends ArrayAdapter<Visite> {

    public VisiteAdapter(Context context, List<Visite> visites) {
        super(context, 0, visites);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        if(convertView == null){
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.row_visite,parent, false);
        }

        VisiteViewHolder viewHolder = (VisiteViewHolder) convertView.getTag();

        if(viewHolder == null){
            viewHolder = new VisiteViewHolder();
            viewHolder.nom = (TextView) convertView.findViewById(R.id.TVnom);
            viewHolder.note = (TextView) convertView.findViewById(R.id.TVnote);
            convertView.setTag(viewHolder);
        }

        Visite tweet = getItem(position);
        viewHolder.nom.setText(tweet.getNom());
        viewHolder.note.setText(tweet.getNote());

        return convertView;
    }

    private class VisiteViewHolder{
        public TextView nom,note;
    }
}