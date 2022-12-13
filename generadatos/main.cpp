#include <iostream>
#include <vector>
#include <fstream>
#include <random>
using namespace std;


int main()
{
    vector<vector<pair<vector<float> , string > > > flor(3);
    
    int size=150;
    
    ifstream file("iris.data");
    
    for(int x=0; x<size; x++)
    {
        vector<float> container;
        pair<vector<float> , string> aux;
        string cad,subcad;
        file>>cad;
        for(int y=0; cad[y]; y++)
        {
            if(cad[y]!=',')
                subcad+=cad[y];
            else
            {
                container.push_back(stof(subcad));
                subcad="";
            }
        }
        
        aux.first=container;
        aux.second=subcad;
        if(subcad=="Iris-setosa")
        {
            flor[0].push_back(aux);
        }
        if(subcad=="Iris-versicolor")
        {
            flor[1].push_back(aux);
        }else if(subcad=="Iris-virginica")
        {
            flor[2].push_back(aux);
        }
    }

    ofstream out_xt("virginicaXtrain.txt");
    ofstream out_yt("virginicaYtrain.txt");
    ofstream out_xp("virginicaXprueba.txt");
    ofstream out_yp("virginicaYprueba.txt");
    
    vector<pair<vector<float> , string > > dataset;
    // 0 setosa
    // 1 versicolor
    // 2 virginica
    for(int x=0; x<15; x++)     //no es tam 15
        dataset.push_back(flor[1][x]);
    
    for(int x=0; x<10; x++)     //no es tam 10
        dataset.push_back(flor[0][x]);
            //total no es 25

     for(int x=0; x<25; x++)    //clasificar
        dataset.push_back(flor[2][x]);
    
    unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();

    shuffle (dataset.begin(), dataset.end(), std::default_random_engine(seed));
    
    int nums=0;
    for(int x=0; x<40; x++)
    {
        for(int y=0; y<4; y++)
            if(y==3)
                out_xt<<dataset[x].first[y]<<endl;
            else
                out_xt<<dataset[x].first[y]<<' ';
        if(dataset[x].second=="Iris-virginica")
        {
            out_yt<<1<<endl;
            nums++;
        }
        else
            out_yt<<0<<endl;
    }
    cout<<dataset.size()<<endl;
    for(int x=40; x<50; x++)
    {
        for(int y=0; y<4; y++)
            if(y==3)
                out_xp<<dataset[x].first[y]<<endl;
            else
                out_xp<<dataset[x].first[y]<<' ';
        if(dataset[x].second=="Iris-virginica"){
            out_yp<<1<<endl;
            nums++;
        }
        else
            out_yp<<0<<endl;
    }
    for(int x=0; x<50; x++)
    {
        cout<<dataset[x].second<<endl;
    }

    out_xt.close();
    out_yt.close();
    out_xp.close();
    out_yp.close();
}
