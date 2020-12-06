using Godot;
using System;

public class RNGManager : Node
{
    DMRNG.RandomNameGenerator _generator;

    public override void _Ready()
    {

    }

    public void Load(string data)
    {
        _generator = new DMRNG.RandomNameGenerator(data);
    }

    public string GetName()
    {
        return _generator.Next();
    }

}
