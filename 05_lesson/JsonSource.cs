using System;

public interface IJsonSource
{
    T GetValue<T>(string key);
    bool TryGetValue<T>(string key, out T value);
    string JsonSource {get;}
}

public class Order
{
    private IJsonSource _jsource;
    public Order(IJsonSource source)
    {
        _jsource = source;
        
    }

    public double Price => _jsource.GetValue("price");
    public DateTime Time => _jsource.GetValue("time");
    public double Qty => _jsource.GetValue("qty");
}