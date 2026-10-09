cask "binlogviz" do
  version "0.23.25"

  on_macos do
    on_intel do
      sha256 "4500fdad5562ff2743a3c9de05e9e2d46adf260d6b92bd8fc1a8abc3ac78ad2b"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.25/binlogviz_0.23.25_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "c7feb64edabf829f974569ba0aa9fb19a58231458e2fc47c91b746152067d870"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.25/binlogviz_0.23.25_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "e044867aa718e91de0f3b9a3edaffb351c83b8b01d7fa597d361c961fc55de66"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.25/binlogviz_0.23.25_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "99e27971be4485f2eca4824366f2c6663517500b02bdb4876d04a61ab1100b3b"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.25/binlogviz_0.23.25_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
